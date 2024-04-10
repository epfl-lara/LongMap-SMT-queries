; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42252 () Bool)

(assert start!42252)

(declare-fun b_free!11757 () Bool)

(declare-fun b_next!11757 () Bool)

(assert (=> start!42252 (= b_free!11757 (not b_next!11757))))

(declare-fun tp!41299 () Bool)

(declare-fun b_and!20195 () Bool)

(assert (=> start!42252 (= tp!41299 b_and!20195)))

(declare-fun res!281669 () Bool)

(declare-fun e!276344 () Bool)

(assert (=> start!42252 (=> (not res!281669) (not e!276344))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42252 (= res!281669 (validMask!0 mask!1365))))

(assert (=> start!42252 e!276344))

(declare-fun tp_is_empty!13185 () Bool)

(assert (=> start!42252 tp_is_empty!13185))

(assert (=> start!42252 tp!41299))

(assert (=> start!42252 true))

(declare-datatypes ((array!30133 0))(
  ( (array!30134 (arr!14488 (Array (_ BitVec 32) (_ BitVec 64))) (size!14840 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30133)

(declare-fun array_inv!10446 (array!30133) Bool)

(assert (=> start!42252 (array_inv!10446 _keys!1025)))

(declare-datatypes ((V!18685 0))(
  ( (V!18686 (val!6637 Int)) )
))
(declare-datatypes ((ValueCell!6249 0))(
  ( (ValueCellFull!6249 (v!8928 V!18685)) (EmptyCell!6249) )
))
(declare-datatypes ((array!30135 0))(
  ( (array!30136 (arr!14489 (Array (_ BitVec 32) ValueCell!6249)) (size!14841 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30135)

(declare-fun e!276343 () Bool)

(declare-fun array_inv!10447 (array!30135) Bool)

(assert (=> start!42252 (and (array_inv!10447 _values!833) e!276343)))

(declare-fun b!471499 () Bool)

(declare-fun res!281670 () Bool)

(assert (=> b!471499 (=> (not res!281670) (not e!276344))))

(declare-datatypes ((List!8819 0))(
  ( (Nil!8816) (Cons!8815 (h!9671 (_ BitVec 64)) (t!14785 List!8819)) )
))
(declare-fun arrayNoDuplicates!0 (array!30133 (_ BitVec 32) List!8819) Bool)

(assert (=> b!471499 (= res!281670 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8816))))

(declare-fun b!471500 () Bool)

(declare-fun e!276341 () Bool)

(declare-fun mapRes!21484 () Bool)

(assert (=> b!471500 (= e!276343 (and e!276341 mapRes!21484))))

(declare-fun condMapEmpty!21484 () Bool)

(declare-fun mapDefault!21484 () ValueCell!6249)

(assert (=> b!471500 (= condMapEmpty!21484 (= (arr!14489 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6249)) mapDefault!21484)))))

(declare-fun b!471501 () Bool)

(assert (=> b!471501 (= e!276344 (not true))))

(declare-datatypes ((tuple2!8738 0))(
  ( (tuple2!8739 (_1!4380 (_ BitVec 64)) (_2!4380 V!18685)) )
))
(declare-datatypes ((List!8820 0))(
  ( (Nil!8817) (Cons!8816 (h!9672 tuple2!8738) (t!14786 List!8820)) )
))
(declare-datatypes ((ListLongMap!7651 0))(
  ( (ListLongMap!7652 (toList!3841 List!8820)) )
))
(declare-fun lt!213915 () ListLongMap!7651)

(declare-fun lt!213917 () ListLongMap!7651)

(assert (=> b!471501 (= lt!213915 lt!213917)))

(declare-fun minValueBefore!38 () V!18685)

(declare-fun zeroValue!794 () V!18685)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18685)

(declare-datatypes ((Unit!13841 0))(
  ( (Unit!13842) )
))
(declare-fun lt!213916 () Unit!13841)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!184 (array!30133 array!30135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18685 V!18685 V!18685 V!18685 (_ BitVec 32) Int) Unit!13841)

(assert (=> b!471501 (= lt!213916 (lemmaNoChangeToArrayThenSameMapNoExtras!184 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2004 (array!30133 array!30135 (_ BitVec 32) (_ BitVec 32) V!18685 V!18685 (_ BitVec 32) Int) ListLongMap!7651)

(assert (=> b!471501 (= lt!213917 (getCurrentListMapNoExtraKeys!2004 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471501 (= lt!213915 (getCurrentListMapNoExtraKeys!2004 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471502 () Bool)

(assert (=> b!471502 (= e!276341 tp_is_empty!13185)))

(declare-fun mapIsEmpty!21484 () Bool)

(assert (=> mapIsEmpty!21484 mapRes!21484))

(declare-fun b!471503 () Bool)

(declare-fun res!281671 () Bool)

(assert (=> b!471503 (=> (not res!281671) (not e!276344))))

(assert (=> b!471503 (= res!281671 (and (= (size!14841 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14840 _keys!1025) (size!14841 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21484 () Bool)

(declare-fun tp!41298 () Bool)

(declare-fun e!276342 () Bool)

(assert (=> mapNonEmpty!21484 (= mapRes!21484 (and tp!41298 e!276342))))

(declare-fun mapKey!21484 () (_ BitVec 32))

(declare-fun mapRest!21484 () (Array (_ BitVec 32) ValueCell!6249))

(declare-fun mapValue!21484 () ValueCell!6249)

(assert (=> mapNonEmpty!21484 (= (arr!14489 _values!833) (store mapRest!21484 mapKey!21484 mapValue!21484))))

(declare-fun b!471504 () Bool)

(declare-fun res!281672 () Bool)

(assert (=> b!471504 (=> (not res!281672) (not e!276344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30133 (_ BitVec 32)) Bool)

(assert (=> b!471504 (= res!281672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471505 () Bool)

(assert (=> b!471505 (= e!276342 tp_is_empty!13185)))

(assert (= (and start!42252 res!281669) b!471503))

(assert (= (and b!471503 res!281671) b!471504))

(assert (= (and b!471504 res!281672) b!471499))

(assert (= (and b!471499 res!281670) b!471501))

(assert (= (and b!471500 condMapEmpty!21484) mapIsEmpty!21484))

(assert (= (and b!471500 (not condMapEmpty!21484)) mapNonEmpty!21484))

(get-info :version)

(assert (= (and mapNonEmpty!21484 ((_ is ValueCellFull!6249) mapValue!21484)) b!471505))

(assert (= (and b!471500 ((_ is ValueCellFull!6249) mapDefault!21484)) b!471502))

(assert (= start!42252 b!471500))

(declare-fun m!453623 () Bool)

(assert (=> b!471501 m!453623))

(declare-fun m!453625 () Bool)

(assert (=> b!471501 m!453625))

(declare-fun m!453627 () Bool)

(assert (=> b!471501 m!453627))

(declare-fun m!453629 () Bool)

(assert (=> b!471504 m!453629))

(declare-fun m!453631 () Bool)

(assert (=> start!42252 m!453631))

(declare-fun m!453633 () Bool)

(assert (=> start!42252 m!453633))

(declare-fun m!453635 () Bool)

(assert (=> start!42252 m!453635))

(declare-fun m!453637 () Bool)

(assert (=> mapNonEmpty!21484 m!453637))

(declare-fun m!453639 () Bool)

(assert (=> b!471499 m!453639))

(check-sat (not start!42252) (not b!471499) (not b!471504) b_and!20195 (not b!471501) (not b_next!11757) (not mapNonEmpty!21484) tp_is_empty!13185)
(check-sat b_and!20195 (not b_next!11757))
