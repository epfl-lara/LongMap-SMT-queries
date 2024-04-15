; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70606 () Bool)

(assert start!70606)

(declare-fun b_free!12913 () Bool)

(declare-fun b_next!12913 () Bool)

(assert (=> start!70606 (= b_free!12913 (not b_next!12913))))

(declare-fun tp!45478 () Bool)

(declare-fun b_and!21741 () Bool)

(assert (=> start!70606 (= tp!45478 b_and!21741)))

(declare-fun res!559695 () Bool)

(declare-fun e!455673 () Bool)

(assert (=> start!70606 (=> (not res!559695) (not e!455673))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70606 (= res!559695 (validMask!0 mask!1312))))

(assert (=> start!70606 e!455673))

(declare-fun tp_is_empty!14623 () Bool)

(assert (=> start!70606 tp_is_empty!14623))

(declare-datatypes ((array!45419 0))(
  ( (array!45420 (arr!21762 (Array (_ BitVec 32) (_ BitVec 64))) (size!22183 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45419)

(declare-fun array_inv!17461 (array!45419) Bool)

(assert (=> start!70606 (array_inv!17461 _keys!976)))

(assert (=> start!70606 true))

(declare-datatypes ((V!24499 0))(
  ( (V!24500 (val!7359 Int)) )
))
(declare-datatypes ((ValueCell!6896 0))(
  ( (ValueCellFull!6896 (v!9784 V!24499)) (EmptyCell!6896) )
))
(declare-datatypes ((array!45421 0))(
  ( (array!45422 (arr!21763 (Array (_ BitVec 32) ValueCell!6896)) (size!22184 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45421)

(declare-fun e!455674 () Bool)

(declare-fun array_inv!17462 (array!45421) Bool)

(assert (=> start!70606 (and (array_inv!17462 _values!788) e!455674)))

(assert (=> start!70606 tp!45478))

(declare-fun mapIsEmpty!23539 () Bool)

(declare-fun mapRes!23539 () Bool)

(assert (=> mapIsEmpty!23539 mapRes!23539))

(declare-fun b!820221 () Bool)

(declare-fun e!455675 () Bool)

(assert (=> b!820221 (= e!455675 tp_is_empty!14623)))

(declare-fun mapNonEmpty!23539 () Bool)

(declare-fun tp!45477 () Bool)

(assert (=> mapNonEmpty!23539 (= mapRes!23539 (and tp!45477 e!455675))))

(declare-fun mapRest!23539 () (Array (_ BitVec 32) ValueCell!6896))

(declare-fun mapValue!23539 () ValueCell!6896)

(declare-fun mapKey!23539 () (_ BitVec 32))

(assert (=> mapNonEmpty!23539 (= (arr!21763 _values!788) (store mapRest!23539 mapKey!23539 mapValue!23539))))

(declare-fun b!820222 () Bool)

(declare-fun res!559698 () Bool)

(assert (=> b!820222 (=> (not res!559698) (not e!455673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45419 (_ BitVec 32)) Bool)

(assert (=> b!820222 (= res!559698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820223 () Bool)

(declare-fun e!455677 () Bool)

(assert (=> b!820223 (= e!455674 (and e!455677 mapRes!23539))))

(declare-fun condMapEmpty!23539 () Bool)

(declare-fun mapDefault!23539 () ValueCell!6896)

(assert (=> b!820223 (= condMapEmpty!23539 (= (arr!21763 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6896)) mapDefault!23539)))))

(declare-fun b!820224 () Bool)

(declare-fun res!559697 () Bool)

(assert (=> b!820224 (=> (not res!559697) (not e!455673))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820224 (= res!559697 (and (= (size!22184 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22183 _keys!976) (size!22184 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820225 () Bool)

(assert (=> b!820225 (= e!455673 (not true))))

(declare-datatypes ((tuple2!9712 0))(
  ( (tuple2!9713 (_1!4867 (_ BitVec 64)) (_2!4867 V!24499)) )
))
(declare-datatypes ((List!15528 0))(
  ( (Nil!15525) (Cons!15524 (h!16653 tuple2!9712) (t!21852 List!15528)) )
))
(declare-datatypes ((ListLongMap!8525 0))(
  ( (ListLongMap!8526 (toList!4278 List!15528)) )
))
(declare-fun lt!368536 () ListLongMap!8525)

(declare-fun lt!368535 () ListLongMap!8525)

(assert (=> b!820225 (= lt!368536 lt!368535)))

(declare-fun zeroValueBefore!34 () V!24499)

(declare-fun zeroValueAfter!34 () V!24499)

(declare-fun minValue!754 () V!24499)

(declare-datatypes ((Unit!27985 0))(
  ( (Unit!27986) )
))
(declare-fun lt!368534 () Unit!27985)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!423 (array!45419 array!45421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24499 V!24499 V!24499 V!24499 (_ BitVec 32) Int) Unit!27985)

(assert (=> b!820225 (= lt!368534 (lemmaNoChangeToArrayThenSameMapNoExtras!423 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2330 (array!45419 array!45421 (_ BitVec 32) (_ BitVec 32) V!24499 V!24499 (_ BitVec 32) Int) ListLongMap!8525)

(assert (=> b!820225 (= lt!368535 (getCurrentListMapNoExtraKeys!2330 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820225 (= lt!368536 (getCurrentListMapNoExtraKeys!2330 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820226 () Bool)

(assert (=> b!820226 (= e!455677 tp_is_empty!14623)))

(declare-fun b!820227 () Bool)

(declare-fun res!559696 () Bool)

(assert (=> b!820227 (=> (not res!559696) (not e!455673))))

(declare-datatypes ((List!15529 0))(
  ( (Nil!15526) (Cons!15525 (h!16654 (_ BitVec 64)) (t!21853 List!15529)) )
))
(declare-fun arrayNoDuplicates!0 (array!45419 (_ BitVec 32) List!15529) Bool)

(assert (=> b!820227 (= res!559696 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15526))))

(assert (= (and start!70606 res!559695) b!820224))

(assert (= (and b!820224 res!559697) b!820222))

(assert (= (and b!820222 res!559698) b!820227))

(assert (= (and b!820227 res!559696) b!820225))

(assert (= (and b!820223 condMapEmpty!23539) mapIsEmpty!23539))

(assert (= (and b!820223 (not condMapEmpty!23539)) mapNonEmpty!23539))

(get-info :version)

(assert (= (and mapNonEmpty!23539 ((_ is ValueCellFull!6896) mapValue!23539)) b!820221))

(assert (= (and b!820223 ((_ is ValueCellFull!6896) mapDefault!23539)) b!820226))

(assert (= start!70606 b!820223))

(declare-fun m!761665 () Bool)

(assert (=> b!820222 m!761665))

(declare-fun m!761667 () Bool)

(assert (=> b!820225 m!761667))

(declare-fun m!761669 () Bool)

(assert (=> b!820225 m!761669))

(declare-fun m!761671 () Bool)

(assert (=> b!820225 m!761671))

(declare-fun m!761673 () Bool)

(assert (=> b!820227 m!761673))

(declare-fun m!761675 () Bool)

(assert (=> start!70606 m!761675))

(declare-fun m!761677 () Bool)

(assert (=> start!70606 m!761677))

(declare-fun m!761679 () Bool)

(assert (=> start!70606 m!761679))

(declare-fun m!761681 () Bool)

(assert (=> mapNonEmpty!23539 m!761681))

(check-sat b_and!21741 (not start!70606) (not b!820227) (not b!820222) (not b_next!12913) tp_is_empty!14623 (not mapNonEmpty!23539) (not b!820225))
(check-sat b_and!21741 (not b_next!12913))
