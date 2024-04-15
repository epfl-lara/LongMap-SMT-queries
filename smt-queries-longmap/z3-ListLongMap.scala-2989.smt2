; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42210 () Bool)

(assert start!42210)

(declare-fun b_free!11743 () Bool)

(declare-fun b_next!11743 () Bool)

(assert (=> start!42210 (= b_free!11743 (not b_next!11743))))

(declare-fun tp!41253 () Bool)

(declare-fun b_and!20147 () Bool)

(assert (=> start!42210 (= tp!41253 b_and!20147)))

(declare-fun b!470996 () Bool)

(declare-fun res!281427 () Bool)

(declare-fun e!276009 () Bool)

(assert (=> b!470996 (=> (not res!281427) (not e!276009))))

(declare-datatypes ((array!30087 0))(
  ( (array!30088 (arr!14466 (Array (_ BitVec 32) (_ BitVec 64))) (size!14819 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30087)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30087 (_ BitVec 32)) Bool)

(assert (=> b!470996 (= res!281427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470997 () Bool)

(declare-fun e!276011 () Bool)

(declare-fun e!276010 () Bool)

(declare-fun mapRes!21460 () Bool)

(assert (=> b!470997 (= e!276011 (and e!276010 mapRes!21460))))

(declare-fun condMapEmpty!21460 () Bool)

(declare-datatypes ((V!18667 0))(
  ( (V!18668 (val!6630 Int)) )
))
(declare-datatypes ((ValueCell!6242 0))(
  ( (ValueCellFull!6242 (v!8915 V!18667)) (EmptyCell!6242) )
))
(declare-datatypes ((array!30089 0))(
  ( (array!30090 (arr!14467 (Array (_ BitVec 32) ValueCell!6242)) (size!14820 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30089)

(declare-fun mapDefault!21460 () ValueCell!6242)

(assert (=> b!470997 (= condMapEmpty!21460 (= (arr!14467 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6242)) mapDefault!21460)))))

(declare-fun mapNonEmpty!21460 () Bool)

(declare-fun tp!41254 () Bool)

(declare-fun e!276008 () Bool)

(assert (=> mapNonEmpty!21460 (= mapRes!21460 (and tp!41254 e!276008))))

(declare-fun mapRest!21460 () (Array (_ BitVec 32) ValueCell!6242))

(declare-fun mapKey!21460 () (_ BitVec 32))

(declare-fun mapValue!21460 () ValueCell!6242)

(assert (=> mapNonEmpty!21460 (= (arr!14467 _values!833) (store mapRest!21460 mapKey!21460 mapValue!21460))))

(declare-fun b!470999 () Bool)

(declare-fun res!281426 () Bool)

(assert (=> b!470999 (=> (not res!281426) (not e!276009))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470999 (= res!281426 (and (= (size!14820 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14819 _keys!1025) (size!14820 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21460 () Bool)

(assert (=> mapIsEmpty!21460 mapRes!21460))

(declare-fun b!471000 () Bool)

(declare-fun res!281428 () Bool)

(assert (=> b!471000 (=> (not res!281428) (not e!276009))))

(declare-datatypes ((List!8835 0))(
  ( (Nil!8832) (Cons!8831 (h!9687 (_ BitVec 64)) (t!14790 List!8835)) )
))
(declare-fun arrayNoDuplicates!0 (array!30087 (_ BitVec 32) List!8835) Bool)

(assert (=> b!471000 (= res!281428 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8832))))

(declare-fun b!471001 () Bool)

(assert (=> b!471001 (= e!276009 (not true))))

(declare-datatypes ((tuple2!8762 0))(
  ( (tuple2!8763 (_1!4392 (_ BitVec 64)) (_2!4392 V!18667)) )
))
(declare-datatypes ((List!8836 0))(
  ( (Nil!8833) (Cons!8832 (h!9688 tuple2!8762) (t!14791 List!8836)) )
))
(declare-datatypes ((ListLongMap!7665 0))(
  ( (ListLongMap!7666 (toList!3848 List!8836)) )
))
(declare-fun lt!213580 () ListLongMap!7665)

(declare-fun lt!213578 () ListLongMap!7665)

(assert (=> b!471001 (= lt!213580 lt!213578)))

(declare-fun minValueBefore!38 () V!18667)

(declare-fun zeroValue!794 () V!18667)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18667)

(declare-datatypes ((Unit!13797 0))(
  ( (Unit!13798) )
))
(declare-fun lt!213579 () Unit!13797)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!180 (array!30087 array!30089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18667 V!18667 V!18667 V!18667 (_ BitVec 32) Int) Unit!13797)

(assert (=> b!471001 (= lt!213579 (lemmaNoChangeToArrayThenSameMapNoExtras!180 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2023 (array!30087 array!30089 (_ BitVec 32) (_ BitVec 32) V!18667 V!18667 (_ BitVec 32) Int) ListLongMap!7665)

(assert (=> b!471001 (= lt!213578 (getCurrentListMapNoExtraKeys!2023 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471001 (= lt!213580 (getCurrentListMapNoExtraKeys!2023 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471002 () Bool)

(declare-fun tp_is_empty!13171 () Bool)

(assert (=> b!471002 (= e!276010 tp_is_empty!13171)))

(declare-fun b!470998 () Bool)

(assert (=> b!470998 (= e!276008 tp_is_empty!13171)))

(declare-fun res!281425 () Bool)

(assert (=> start!42210 (=> (not res!281425) (not e!276009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42210 (= res!281425 (validMask!0 mask!1365))))

(assert (=> start!42210 e!276009))

(assert (=> start!42210 tp_is_empty!13171))

(assert (=> start!42210 tp!41253))

(assert (=> start!42210 true))

(declare-fun array_inv!10518 (array!30087) Bool)

(assert (=> start!42210 (array_inv!10518 _keys!1025)))

(declare-fun array_inv!10519 (array!30089) Bool)

(assert (=> start!42210 (and (array_inv!10519 _values!833) e!276011)))

(assert (= (and start!42210 res!281425) b!470999))

(assert (= (and b!470999 res!281426) b!470996))

(assert (= (and b!470996 res!281427) b!471000))

(assert (= (and b!471000 res!281428) b!471001))

(assert (= (and b!470997 condMapEmpty!21460) mapIsEmpty!21460))

(assert (= (and b!470997 (not condMapEmpty!21460)) mapNonEmpty!21460))

(get-info :version)

(assert (= (and mapNonEmpty!21460 ((_ is ValueCellFull!6242) mapValue!21460)) b!470998))

(assert (= (and b!470997 ((_ is ValueCellFull!6242) mapDefault!21460)) b!471002))

(assert (= start!42210 b!470997))

(declare-fun m!452697 () Bool)

(assert (=> b!470996 m!452697))

(declare-fun m!452699 () Bool)

(assert (=> b!471000 m!452699))

(declare-fun m!452701 () Bool)

(assert (=> mapNonEmpty!21460 m!452701))

(declare-fun m!452703 () Bool)

(assert (=> b!471001 m!452703))

(declare-fun m!452705 () Bool)

(assert (=> b!471001 m!452705))

(declare-fun m!452707 () Bool)

(assert (=> b!471001 m!452707))

(declare-fun m!452709 () Bool)

(assert (=> start!42210 m!452709))

(declare-fun m!452711 () Bool)

(assert (=> start!42210 m!452711))

(declare-fun m!452713 () Bool)

(assert (=> start!42210 m!452713))

(check-sat (not start!42210) (not mapNonEmpty!21460) tp_is_empty!13171 (not b!470996) (not b_next!11743) b_and!20147 (not b!471000) (not b!471001))
(check-sat b_and!20147 (not b_next!11743))
