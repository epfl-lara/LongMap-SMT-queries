; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35758 () Bool)

(assert start!35758)

(declare-fun res!199664 () Bool)

(declare-fun e!219962 () Bool)

(assert (=> start!35758 (=> (not res!199664) (not e!219962))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35758 (= res!199664 (validMask!0 mask!1842))))

(assert (=> start!35758 e!219962))

(assert (=> start!35758 true))

(declare-datatypes ((V!11925 0))(
  ( (V!11926 (val!4150 Int)) )
))
(declare-datatypes ((ValueCell!3762 0))(
  ( (ValueCellFull!3762 (v!6344 V!11925)) (EmptyCell!3762) )
))
(declare-datatypes ((array!19981 0))(
  ( (array!19982 (arr!9484 (Array (_ BitVec 32) ValueCell!3762)) (size!9836 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19981)

(declare-fun e!219959 () Bool)

(declare-fun array_inv!6978 (array!19981) Bool)

(assert (=> start!35758 (and (array_inv!6978 _values!1208) e!219959)))

(declare-datatypes ((array!19983 0))(
  ( (array!19984 (arr!9485 (Array (_ BitVec 32) (_ BitVec 64))) (size!9837 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19983)

(declare-fun array_inv!6979 (array!19983) Bool)

(assert (=> start!35758 (array_inv!6979 _keys!1456)))

(declare-fun mapIsEmpty!13824 () Bool)

(declare-fun mapRes!13824 () Bool)

(assert (=> mapIsEmpty!13824 mapRes!13824))

(declare-fun b!359210 () Bool)

(assert (=> b!359210 (= e!219962 false)))

(declare-fun lt!166304 () Bool)

(declare-datatypes ((List!5459 0))(
  ( (Nil!5456) (Cons!5455 (h!6311 (_ BitVec 64)) (t!10609 List!5459)) )
))
(declare-fun arrayNoDuplicates!0 (array!19983 (_ BitVec 32) List!5459) Bool)

(assert (=> b!359210 (= lt!166304 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5456))))

(declare-fun b!359211 () Bool)

(declare-fun res!199665 () Bool)

(assert (=> b!359211 (=> (not res!199665) (not e!219962))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359211 (= res!199665 (and (= (size!9836 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9837 _keys!1456) (size!9836 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359212 () Bool)

(declare-fun res!199666 () Bool)

(assert (=> b!359212 (=> (not res!199666) (not e!219962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19983 (_ BitVec 32)) Bool)

(assert (=> b!359212 (= res!199666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359213 () Bool)

(declare-fun e!219961 () Bool)

(declare-fun tp_is_empty!8211 () Bool)

(assert (=> b!359213 (= e!219961 tp_is_empty!8211)))

(declare-fun b!359214 () Bool)

(assert (=> b!359214 (= e!219959 (and e!219961 mapRes!13824))))

(declare-fun condMapEmpty!13824 () Bool)

(declare-fun mapDefault!13824 () ValueCell!3762)

(assert (=> b!359214 (= condMapEmpty!13824 (= (arr!9484 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3762)) mapDefault!13824)))))

(declare-fun b!359215 () Bool)

(declare-fun e!219960 () Bool)

(assert (=> b!359215 (= e!219960 tp_is_empty!8211)))

(declare-fun mapNonEmpty!13824 () Bool)

(declare-fun tp!27891 () Bool)

(assert (=> mapNonEmpty!13824 (= mapRes!13824 (and tp!27891 e!219960))))

(declare-fun mapValue!13824 () ValueCell!3762)

(declare-fun mapRest!13824 () (Array (_ BitVec 32) ValueCell!3762))

(declare-fun mapKey!13824 () (_ BitVec 32))

(assert (=> mapNonEmpty!13824 (= (arr!9484 _values!1208) (store mapRest!13824 mapKey!13824 mapValue!13824))))

(assert (= (and start!35758 res!199664) b!359211))

(assert (= (and b!359211 res!199665) b!359212))

(assert (= (and b!359212 res!199666) b!359210))

(assert (= (and b!359214 condMapEmpty!13824) mapIsEmpty!13824))

(assert (= (and b!359214 (not condMapEmpty!13824)) mapNonEmpty!13824))

(get-info :version)

(assert (= (and mapNonEmpty!13824 ((_ is ValueCellFull!3762) mapValue!13824)) b!359215))

(assert (= (and b!359214 ((_ is ValueCellFull!3762) mapDefault!13824)) b!359213))

(assert (= start!35758 b!359214))

(declare-fun m!356791 () Bool)

(assert (=> start!35758 m!356791))

(declare-fun m!356793 () Bool)

(assert (=> start!35758 m!356793))

(declare-fun m!356795 () Bool)

(assert (=> start!35758 m!356795))

(declare-fun m!356797 () Bool)

(assert (=> b!359210 m!356797))

(declare-fun m!356799 () Bool)

(assert (=> b!359212 m!356799))

(declare-fun m!356801 () Bool)

(assert (=> mapNonEmpty!13824 m!356801))

(check-sat (not b!359212) (not b!359210) (not start!35758) tp_is_empty!8211 (not mapNonEmpty!13824))
(check-sat)
