; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41952 () Bool)

(assert start!41952)

(declare-fun b_free!11539 () Bool)

(declare-fun b_next!11539 () Bool)

(assert (=> start!41952 (= b_free!11539 (not b_next!11539))))

(declare-fun tp!40632 () Bool)

(declare-fun b_and!19911 () Bool)

(assert (=> start!41952 (= tp!40632 b_and!19911)))

(declare-fun b!468251 () Bool)

(declare-fun e!274041 () Bool)

(declare-fun e!274042 () Bool)

(declare-fun mapRes!21145 () Bool)

(assert (=> b!468251 (= e!274041 (and e!274042 mapRes!21145))))

(declare-fun condMapEmpty!21145 () Bool)

(declare-datatypes ((V!18395 0))(
  ( (V!18396 (val!6528 Int)) )
))
(declare-datatypes ((ValueCell!6140 0))(
  ( (ValueCellFull!6140 (v!8811 V!18395)) (EmptyCell!6140) )
))
(declare-datatypes ((array!29697 0))(
  ( (array!29698 (arr!14274 (Array (_ BitVec 32) ValueCell!6140)) (size!14627 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29697)

(declare-fun mapDefault!21145 () ValueCell!6140)

(assert (=> b!468251 (= condMapEmpty!21145 (= (arr!14274 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6140)) mapDefault!21145)))))

(declare-fun b!468252 () Bool)

(declare-fun e!274043 () Bool)

(declare-fun tp_is_empty!12967 () Bool)

(assert (=> b!468252 (= e!274043 tp_is_empty!12967)))

(declare-fun b!468253 () Bool)

(assert (=> b!468253 (= e!274042 tp_is_empty!12967)))

(declare-fun b!468254 () Bool)

(declare-fun e!274039 () Bool)

(assert (=> b!468254 (= e!274039 true)))

(declare-datatypes ((tuple2!8618 0))(
  ( (tuple2!8619 (_1!4320 (_ BitVec 64)) (_2!4320 V!18395)) )
))
(declare-datatypes ((List!8692 0))(
  ( (Nil!8689) (Cons!8688 (h!9544 tuple2!8618) (t!14641 List!8692)) )
))
(declare-datatypes ((ListLongMap!7521 0))(
  ( (ListLongMap!7522 (toList!3776 List!8692)) )
))
(declare-fun lt!211682 () ListLongMap!7521)

(declare-fun lt!211680 () tuple2!8618)

(declare-fun minValueBefore!38 () V!18395)

(declare-fun +!1709 (ListLongMap!7521 tuple2!8618) ListLongMap!7521)

(assert (=> b!468254 (= (+!1709 lt!211682 lt!211680) (+!1709 (+!1709 lt!211682 (tuple2!8619 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211680))))

(declare-fun minValueAfter!38 () V!18395)

(assert (=> b!468254 (= lt!211680 (tuple2!8619 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13649 0))(
  ( (Unit!13650) )
))
(declare-fun lt!211678 () Unit!13649)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!92 (ListLongMap!7521 (_ BitVec 64) V!18395 V!18395) Unit!13649)

(assert (=> b!468254 (= lt!211678 (addSameAsAddTwiceSameKeyDiffValues!92 lt!211682 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!211679 () ListLongMap!7521)

(declare-fun zeroValue!794 () V!18395)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29699 0))(
  ( (array!29700 (arr!14275 (Array (_ BitVec 32) (_ BitVec 64))) (size!14628 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29699)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2145 (array!29699 array!29697 (_ BitVec 32) (_ BitVec 32) V!18395 V!18395 (_ BitVec 32) Int) ListLongMap!7521)

(assert (=> b!468254 (= lt!211679 (getCurrentListMap!2145 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!211683 () ListLongMap!7521)

(assert (=> b!468254 (= lt!211683 (getCurrentListMap!2145 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468255 () Bool)

(declare-fun res!279858 () Bool)

(declare-fun e!274040 () Bool)

(assert (=> b!468255 (=> (not res!279858) (not e!274040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29699 (_ BitVec 32)) Bool)

(assert (=> b!468255 (= res!279858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468256 () Bool)

(assert (=> b!468256 (= e!274040 (not e!274039))))

(declare-fun res!279856 () Bool)

(assert (=> b!468256 (=> res!279856 e!274039)))

(assert (=> b!468256 (= res!279856 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211681 () ListLongMap!7521)

(assert (=> b!468256 (= lt!211682 lt!211681)))

(declare-fun lt!211684 () Unit!13649)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!113 (array!29699 array!29697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18395 V!18395 V!18395 V!18395 (_ BitVec 32) Int) Unit!13649)

(assert (=> b!468256 (= lt!211684 (lemmaNoChangeToArrayThenSameMapNoExtras!113 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1956 (array!29699 array!29697 (_ BitVec 32) (_ BitVec 32) V!18395 V!18395 (_ BitVec 32) Int) ListLongMap!7521)

(assert (=> b!468256 (= lt!211681 (getCurrentListMapNoExtraKeys!1956 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468256 (= lt!211682 (getCurrentListMapNoExtraKeys!1956 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279857 () Bool)

(assert (=> start!41952 (=> (not res!279857) (not e!274040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41952 (= res!279857 (validMask!0 mask!1365))))

(assert (=> start!41952 e!274040))

(assert (=> start!41952 tp_is_empty!12967))

(assert (=> start!41952 tp!40632))

(assert (=> start!41952 true))

(declare-fun array_inv!10390 (array!29699) Bool)

(assert (=> start!41952 (array_inv!10390 _keys!1025)))

(declare-fun array_inv!10391 (array!29697) Bool)

(assert (=> start!41952 (and (array_inv!10391 _values!833) e!274041)))

(declare-fun mapNonEmpty!21145 () Bool)

(declare-fun tp!40633 () Bool)

(assert (=> mapNonEmpty!21145 (= mapRes!21145 (and tp!40633 e!274043))))

(declare-fun mapKey!21145 () (_ BitVec 32))

(declare-fun mapValue!21145 () ValueCell!6140)

(declare-fun mapRest!21145 () (Array (_ BitVec 32) ValueCell!6140))

(assert (=> mapNonEmpty!21145 (= (arr!14274 _values!833) (store mapRest!21145 mapKey!21145 mapValue!21145))))

(declare-fun b!468257 () Bool)

(declare-fun res!279859 () Bool)

(assert (=> b!468257 (=> (not res!279859) (not e!274040))))

(declare-datatypes ((List!8693 0))(
  ( (Nil!8690) (Cons!8689 (h!9545 (_ BitVec 64)) (t!14642 List!8693)) )
))
(declare-fun arrayNoDuplicates!0 (array!29699 (_ BitVec 32) List!8693) Bool)

(assert (=> b!468257 (= res!279859 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8690))))

(declare-fun mapIsEmpty!21145 () Bool)

(assert (=> mapIsEmpty!21145 mapRes!21145))

(declare-fun b!468258 () Bool)

(declare-fun res!279860 () Bool)

(assert (=> b!468258 (=> (not res!279860) (not e!274040))))

(assert (=> b!468258 (= res!279860 (and (= (size!14627 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14628 _keys!1025) (size!14627 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41952 res!279857) b!468258))

(assert (= (and b!468258 res!279860) b!468255))

(assert (= (and b!468255 res!279858) b!468257))

(assert (= (and b!468257 res!279859) b!468256))

(assert (= (and b!468256 (not res!279856)) b!468254))

(assert (= (and b!468251 condMapEmpty!21145) mapIsEmpty!21145))

(assert (= (and b!468251 (not condMapEmpty!21145)) mapNonEmpty!21145))

(get-info :version)

(assert (= (and mapNonEmpty!21145 ((_ is ValueCellFull!6140) mapValue!21145)) b!468252))

(assert (= (and b!468251 ((_ is ValueCellFull!6140) mapDefault!21145)) b!468253))

(assert (= start!41952 b!468251))

(declare-fun m!449747 () Bool)

(assert (=> b!468257 m!449747))

(declare-fun m!449749 () Bool)

(assert (=> b!468254 m!449749))

(declare-fun m!449751 () Bool)

(assert (=> b!468254 m!449751))

(declare-fun m!449753 () Bool)

(assert (=> b!468254 m!449753))

(assert (=> b!468254 m!449749))

(declare-fun m!449755 () Bool)

(assert (=> b!468254 m!449755))

(declare-fun m!449757 () Bool)

(assert (=> b!468254 m!449757))

(declare-fun m!449759 () Bool)

(assert (=> b!468254 m!449759))

(declare-fun m!449761 () Bool)

(assert (=> mapNonEmpty!21145 m!449761))

(declare-fun m!449763 () Bool)

(assert (=> b!468255 m!449763))

(declare-fun m!449765 () Bool)

(assert (=> start!41952 m!449765))

(declare-fun m!449767 () Bool)

(assert (=> start!41952 m!449767))

(declare-fun m!449769 () Bool)

(assert (=> start!41952 m!449769))

(declare-fun m!449771 () Bool)

(assert (=> b!468256 m!449771))

(declare-fun m!449773 () Bool)

(assert (=> b!468256 m!449773))

(declare-fun m!449775 () Bool)

(assert (=> b!468256 m!449775))

(check-sat (not start!41952) (not mapNonEmpty!21145) (not b!468256) (not b!468255) (not b!468257) tp_is_empty!12967 (not b_next!11539) (not b!468254) b_and!19911)
(check-sat b_and!19911 (not b_next!11539))
