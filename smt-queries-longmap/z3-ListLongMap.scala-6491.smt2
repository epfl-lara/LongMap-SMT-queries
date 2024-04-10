; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82788 () Bool)

(assert start!82788)

(declare-fun b!965677 () Bool)

(declare-fun e!544375 () Bool)

(declare-fun tp_is_empty!21723 () Bool)

(assert (=> b!965677 (= e!544375 tp_is_empty!21723)))

(declare-fun b!965678 () Bool)

(declare-fun e!544376 () Bool)

(assert (=> b!965678 (= e!544376 tp_is_empty!21723)))

(declare-fun e!544374 () Bool)

(declare-fun b!965679 () Bool)

(declare-datatypes ((array!59531 0))(
  ( (array!59532 (arr!28634 (Array (_ BitVec 32) (_ BitVec 64))) (size!29113 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59531)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965679 (= e!544374 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29113 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29113 _keys!1686)) (bvslt i!803 #b00000000000000000000000000000000)))))

(declare-fun b!965680 () Bool)

(declare-fun res!646396 () Bool)

(assert (=> b!965680 (=> (not res!646396) (not e!544374))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59531 (_ BitVec 32)) Bool)

(assert (=> b!965680 (= res!646396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965681 () Bool)

(declare-fun res!646398 () Bool)

(assert (=> b!965681 (=> (not res!646398) (not e!544374))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33947 0))(
  ( (V!33948 (val!10912 Int)) )
))
(declare-datatypes ((ValueCell!10380 0))(
  ( (ValueCellFull!10380 (v!13470 V!33947)) (EmptyCell!10380) )
))
(declare-datatypes ((array!59533 0))(
  ( (array!59534 (arr!28635 (Array (_ BitVec 32) ValueCell!10380)) (size!29114 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59533)

(assert (=> b!965681 (= res!646398 (and (= (size!29114 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29113 _keys!1686) (size!29114 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965683 () Bool)

(declare-fun res!646397 () Bool)

(assert (=> b!965683 (=> (not res!646397) (not e!544374))))

(declare-datatypes ((List!19878 0))(
  ( (Nil!19875) (Cons!19874 (h!21036 (_ BitVec 64)) (t!28241 List!19878)) )
))
(declare-fun arrayNoDuplicates!0 (array!59531 (_ BitVec 32) List!19878) Bool)

(assert (=> b!965683 (= res!646397 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19875))))

(declare-fun mapIsEmpty!34579 () Bool)

(declare-fun mapRes!34579 () Bool)

(assert (=> mapIsEmpty!34579 mapRes!34579))

(declare-fun mapNonEmpty!34579 () Bool)

(declare-fun tp!65877 () Bool)

(assert (=> mapNonEmpty!34579 (= mapRes!34579 (and tp!65877 e!544376))))

(declare-fun mapValue!34579 () ValueCell!10380)

(declare-fun mapRest!34579 () (Array (_ BitVec 32) ValueCell!10380))

(declare-fun mapKey!34579 () (_ BitVec 32))

(assert (=> mapNonEmpty!34579 (= (arr!28635 _values!1400) (store mapRest!34579 mapKey!34579 mapValue!34579))))

(declare-fun res!646399 () Bool)

(assert (=> start!82788 (=> (not res!646399) (not e!544374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82788 (= res!646399 (validMask!0 mask!2110))))

(assert (=> start!82788 e!544374))

(assert (=> start!82788 true))

(declare-fun e!544373 () Bool)

(declare-fun array_inv!22175 (array!59533) Bool)

(assert (=> start!82788 (and (array_inv!22175 _values!1400) e!544373)))

(declare-fun array_inv!22176 (array!59531) Bool)

(assert (=> start!82788 (array_inv!22176 _keys!1686)))

(declare-fun b!965682 () Bool)

(assert (=> b!965682 (= e!544373 (and e!544375 mapRes!34579))))

(declare-fun condMapEmpty!34579 () Bool)

(declare-fun mapDefault!34579 () ValueCell!10380)

(assert (=> b!965682 (= condMapEmpty!34579 (= (arr!28635 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10380)) mapDefault!34579)))))

(assert (= (and start!82788 res!646399) b!965681))

(assert (= (and b!965681 res!646398) b!965680))

(assert (= (and b!965680 res!646396) b!965683))

(assert (= (and b!965683 res!646397) b!965679))

(assert (= (and b!965682 condMapEmpty!34579) mapIsEmpty!34579))

(assert (= (and b!965682 (not condMapEmpty!34579)) mapNonEmpty!34579))

(get-info :version)

(assert (= (and mapNonEmpty!34579 ((_ is ValueCellFull!10380) mapValue!34579)) b!965678))

(assert (= (and b!965682 ((_ is ValueCellFull!10380) mapDefault!34579)) b!965677))

(assert (= start!82788 b!965682))

(declare-fun m!894681 () Bool)

(assert (=> b!965680 m!894681))

(declare-fun m!894683 () Bool)

(assert (=> b!965683 m!894683))

(declare-fun m!894685 () Bool)

(assert (=> mapNonEmpty!34579 m!894685))

(declare-fun m!894687 () Bool)

(assert (=> start!82788 m!894687))

(declare-fun m!894689 () Bool)

(assert (=> start!82788 m!894689))

(declare-fun m!894691 () Bool)

(assert (=> start!82788 m!894691))

(check-sat tp_is_empty!21723 (not b!965680) (not mapNonEmpty!34579) (not start!82788) (not b!965683))
(check-sat)
