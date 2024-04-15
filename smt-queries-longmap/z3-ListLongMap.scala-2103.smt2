; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35772 () Bool)

(assert start!35772)

(declare-fun b!359187 () Bool)

(declare-fun e!219995 () Bool)

(assert (=> b!359187 (= e!219995 false)))

(declare-fun lt!166111 () Bool)

(declare-datatypes ((array!20009 0))(
  ( (array!20010 (arr!9498 (Array (_ BitVec 32) (_ BitVec 64))) (size!9851 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20009)

(declare-datatypes ((List!5433 0))(
  ( (Nil!5430) (Cons!5429 (h!6285 (_ BitVec 64)) (t!10574 List!5433)) )
))
(declare-fun arrayNoDuplicates!0 (array!20009 (_ BitVec 32) List!5433) Bool)

(assert (=> b!359187 (= lt!166111 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5430))))

(declare-fun b!359188 () Bool)

(declare-fun e!219996 () Bool)

(declare-fun tp_is_empty!8239 () Bool)

(assert (=> b!359188 (= e!219996 tp_is_empty!8239)))

(declare-fun mapNonEmpty!13866 () Bool)

(declare-fun mapRes!13866 () Bool)

(declare-fun tp!27933 () Bool)

(declare-fun e!219993 () Bool)

(assert (=> mapNonEmpty!13866 (= mapRes!13866 (and tp!27933 e!219993))))

(declare-fun mapKey!13866 () (_ BitVec 32))

(declare-datatypes ((V!11963 0))(
  ( (V!11964 (val!4164 Int)) )
))
(declare-datatypes ((ValueCell!3776 0))(
  ( (ValueCellFull!3776 (v!6352 V!11963)) (EmptyCell!3776) )
))
(declare-fun mapRest!13866 () (Array (_ BitVec 32) ValueCell!3776))

(declare-datatypes ((array!20011 0))(
  ( (array!20012 (arr!9499 (Array (_ BitVec 32) ValueCell!3776)) (size!9852 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20011)

(declare-fun mapValue!13866 () ValueCell!3776)

(assert (=> mapNonEmpty!13866 (= (arr!9499 _values!1208) (store mapRest!13866 mapKey!13866 mapValue!13866))))

(declare-fun b!359189 () Bool)

(declare-fun e!219994 () Bool)

(assert (=> b!359189 (= e!219994 (and e!219996 mapRes!13866))))

(declare-fun condMapEmpty!13866 () Bool)

(declare-fun mapDefault!13866 () ValueCell!3776)

(assert (=> b!359189 (= condMapEmpty!13866 (= (arr!9499 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3776)) mapDefault!13866)))))

(declare-fun b!359190 () Bool)

(declare-fun res!199663 () Bool)

(assert (=> b!359190 (=> (not res!199663) (not e!219995))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20009 (_ BitVec 32)) Bool)

(assert (=> b!359190 (= res!199663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359191 () Bool)

(assert (=> b!359191 (= e!219993 tp_is_empty!8239)))

(declare-fun b!359192 () Bool)

(declare-fun res!199662 () Bool)

(assert (=> b!359192 (=> (not res!199662) (not e!219995))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359192 (= res!199662 (and (= (size!9852 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9851 _keys!1456) (size!9852 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13866 () Bool)

(assert (=> mapIsEmpty!13866 mapRes!13866))

(declare-fun res!199661 () Bool)

(assert (=> start!35772 (=> (not res!199661) (not e!219995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35772 (= res!199661 (validMask!0 mask!1842))))

(assert (=> start!35772 e!219995))

(assert (=> start!35772 true))

(declare-fun array_inv!7010 (array!20011) Bool)

(assert (=> start!35772 (and (array_inv!7010 _values!1208) e!219994)))

(declare-fun array_inv!7011 (array!20009) Bool)

(assert (=> start!35772 (array_inv!7011 _keys!1456)))

(assert (= (and start!35772 res!199661) b!359192))

(assert (= (and b!359192 res!199662) b!359190))

(assert (= (and b!359190 res!199663) b!359187))

(assert (= (and b!359189 condMapEmpty!13866) mapIsEmpty!13866))

(assert (= (and b!359189 (not condMapEmpty!13866)) mapNonEmpty!13866))

(get-info :version)

(assert (= (and mapNonEmpty!13866 ((_ is ValueCellFull!3776) mapValue!13866)) b!359191))

(assert (= (and b!359189 ((_ is ValueCellFull!3776) mapDefault!13866)) b!359188))

(assert (= start!35772 b!359189))

(declare-fun m!356229 () Bool)

(assert (=> b!359187 m!356229))

(declare-fun m!356231 () Bool)

(assert (=> mapNonEmpty!13866 m!356231))

(declare-fun m!356233 () Bool)

(assert (=> b!359190 m!356233))

(declare-fun m!356235 () Bool)

(assert (=> start!35772 m!356235))

(declare-fun m!356237 () Bool)

(assert (=> start!35772 m!356237))

(declare-fun m!356239 () Bool)

(assert (=> start!35772 m!356239))

(check-sat (not start!35772) (not b!359190) (not mapNonEmpty!13866) tp_is_empty!8239 (not b!359187))
(check-sat)
