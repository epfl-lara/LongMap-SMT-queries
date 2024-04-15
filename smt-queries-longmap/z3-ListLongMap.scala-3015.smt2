; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42410 () Bool)

(assert start!42410)

(declare-fun b_free!11899 () Bool)

(declare-fun b_next!11899 () Bool)

(assert (=> start!42410 (= b_free!11899 (not b_next!11899))))

(declare-fun tp!41730 () Bool)

(declare-fun b_and!20329 () Bool)

(assert (=> start!42410 (= tp!41730 b_and!20329)))

(declare-fun b!473089 () Bool)

(declare-fun res!282621 () Bool)

(declare-fun e!277519 () Bool)

(assert (=> b!473089 (=> (not res!282621) (not e!277519))))

(declare-datatypes ((array!30391 0))(
  ( (array!30392 (arr!14615 (Array (_ BitVec 32) (_ BitVec 64))) (size!14968 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30391)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30391 (_ BitVec 32)) Bool)

(assert (=> b!473089 (= res!282621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21703 () Bool)

(declare-fun mapRes!21703 () Bool)

(declare-fun tp!41731 () Bool)

(declare-fun e!277518 () Bool)

(assert (=> mapNonEmpty!21703 (= mapRes!21703 (and tp!41731 e!277518))))

(declare-datatypes ((V!18875 0))(
  ( (V!18876 (val!6708 Int)) )
))
(declare-datatypes ((ValueCell!6320 0))(
  ( (ValueCellFull!6320 (v!8993 V!18875)) (EmptyCell!6320) )
))
(declare-datatypes ((array!30393 0))(
  ( (array!30394 (arr!14616 (Array (_ BitVec 32) ValueCell!6320)) (size!14969 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30393)

(declare-fun mapRest!21703 () (Array (_ BitVec 32) ValueCell!6320))

(declare-fun mapValue!21703 () ValueCell!6320)

(declare-fun mapKey!21703 () (_ BitVec 32))

(assert (=> mapNonEmpty!21703 (= (arr!14616 _values!833) (store mapRest!21703 mapKey!21703 mapValue!21703))))

(declare-fun b!473090 () Bool)

(declare-fun res!282622 () Bool)

(assert (=> b!473090 (=> (not res!282622) (not e!277519))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!473090 (= res!282622 (and (= (size!14969 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14968 _keys!1025) (size!14969 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473091 () Bool)

(declare-fun e!277522 () Bool)

(assert (=> b!473091 (= e!277519 (not e!277522))))

(declare-fun res!282618 () Bool)

(assert (=> b!473091 (=> res!282618 e!277522)))

(assert (=> b!473091 (= res!282618 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8886 0))(
  ( (tuple2!8887 (_1!4454 (_ BitVec 64)) (_2!4454 V!18875)) )
))
(declare-datatypes ((List!8953 0))(
  ( (Nil!8950) (Cons!8949 (h!9805 tuple2!8886) (t!14914 List!8953)) )
))
(declare-datatypes ((ListLongMap!7789 0))(
  ( (ListLongMap!7790 (toList!3910 List!8953)) )
))
(declare-fun lt!214833 () ListLongMap!7789)

(declare-fun lt!214834 () ListLongMap!7789)

(assert (=> b!473091 (= lt!214833 lt!214834)))

(declare-fun minValueBefore!38 () V!18875)

(declare-datatypes ((Unit!13914 0))(
  ( (Unit!13915) )
))
(declare-fun lt!214831 () Unit!13914)

(declare-fun zeroValue!794 () V!18875)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18875)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!236 (array!30391 array!30393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18875 V!18875 V!18875 V!18875 (_ BitVec 32) Int) Unit!13914)

(assert (=> b!473091 (= lt!214831 (lemmaNoChangeToArrayThenSameMapNoExtras!236 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2079 (array!30391 array!30393 (_ BitVec 32) (_ BitVec 32) V!18875 V!18875 (_ BitVec 32) Int) ListLongMap!7789)

(assert (=> b!473091 (= lt!214834 (getCurrentListMapNoExtraKeys!2079 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473091 (= lt!214833 (getCurrentListMapNoExtraKeys!2079 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473092 () Bool)

(declare-fun e!277521 () Bool)

(declare-fun tp_is_empty!13327 () Bool)

(assert (=> b!473092 (= e!277521 tp_is_empty!13327)))

(declare-fun b!473093 () Bool)

(assert (=> b!473093 (= e!277522 true)))

(declare-fun lt!214828 () ListLongMap!7789)

(declare-fun lt!214827 () tuple2!8886)

(declare-fun +!1762 (ListLongMap!7789 tuple2!8886) ListLongMap!7789)

(assert (=> b!473093 (= (+!1762 lt!214828 lt!214827) (+!1762 (+!1762 lt!214828 (tuple2!8887 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214827))))

(assert (=> b!473093 (= lt!214827 (tuple2!8887 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214829 () Unit!13914)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!141 (ListLongMap!7789 (_ BitVec 64) V!18875 V!18875) Unit!13914)

(assert (=> b!473093 (= lt!214829 (addSameAsAddTwiceSameKeyDiffValues!141 lt!214828 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473093 (= lt!214828 (+!1762 lt!214833 (tuple2!8887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214832 () ListLongMap!7789)

(declare-fun getCurrentListMap!2214 (array!30391 array!30393 (_ BitVec 32) (_ BitVec 32) V!18875 V!18875 (_ BitVec 32) Int) ListLongMap!7789)

(assert (=> b!473093 (= lt!214832 (getCurrentListMap!2214 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214830 () ListLongMap!7789)

(assert (=> b!473093 (= lt!214830 (getCurrentListMap!2214 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282620 () Bool)

(assert (=> start!42410 (=> (not res!282620) (not e!277519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42410 (= res!282620 (validMask!0 mask!1365))))

(assert (=> start!42410 e!277519))

(assert (=> start!42410 tp_is_empty!13327))

(assert (=> start!42410 tp!41730))

(assert (=> start!42410 true))

(declare-fun array_inv!10630 (array!30391) Bool)

(assert (=> start!42410 (array_inv!10630 _keys!1025)))

(declare-fun e!277520 () Bool)

(declare-fun array_inv!10631 (array!30393) Bool)

(assert (=> start!42410 (and (array_inv!10631 _values!833) e!277520)))

(declare-fun b!473094 () Bool)

(declare-fun res!282619 () Bool)

(assert (=> b!473094 (=> (not res!282619) (not e!277519))))

(declare-datatypes ((List!8954 0))(
  ( (Nil!8951) (Cons!8950 (h!9806 (_ BitVec 64)) (t!14915 List!8954)) )
))
(declare-fun arrayNoDuplicates!0 (array!30391 (_ BitVec 32) List!8954) Bool)

(assert (=> b!473094 (= res!282619 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8951))))

(declare-fun b!473095 () Bool)

(assert (=> b!473095 (= e!277518 tp_is_empty!13327)))

(declare-fun b!473096 () Bool)

(assert (=> b!473096 (= e!277520 (and e!277521 mapRes!21703))))

(declare-fun condMapEmpty!21703 () Bool)

(declare-fun mapDefault!21703 () ValueCell!6320)

(assert (=> b!473096 (= condMapEmpty!21703 (= (arr!14616 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6320)) mapDefault!21703)))))

(declare-fun mapIsEmpty!21703 () Bool)

(assert (=> mapIsEmpty!21703 mapRes!21703))

(assert (= (and start!42410 res!282620) b!473090))

(assert (= (and b!473090 res!282622) b!473089))

(assert (= (and b!473089 res!282621) b!473094))

(assert (= (and b!473094 res!282619) b!473091))

(assert (= (and b!473091 (not res!282618)) b!473093))

(assert (= (and b!473096 condMapEmpty!21703) mapIsEmpty!21703))

(assert (= (and b!473096 (not condMapEmpty!21703)) mapNonEmpty!21703))

(get-info :version)

(assert (= (and mapNonEmpty!21703 ((_ is ValueCellFull!6320) mapValue!21703)) b!473095))

(assert (= (and b!473096 ((_ is ValueCellFull!6320) mapDefault!21703)) b!473092))

(assert (= start!42410 b!473096))

(declare-fun m!454651 () Bool)

(assert (=> b!473091 m!454651))

(declare-fun m!454653 () Bool)

(assert (=> b!473091 m!454653))

(declare-fun m!454655 () Bool)

(assert (=> b!473091 m!454655))

(declare-fun m!454657 () Bool)

(assert (=> start!42410 m!454657))

(declare-fun m!454659 () Bool)

(assert (=> start!42410 m!454659))

(declare-fun m!454661 () Bool)

(assert (=> start!42410 m!454661))

(declare-fun m!454663 () Bool)

(assert (=> b!473094 m!454663))

(declare-fun m!454665 () Bool)

(assert (=> b!473089 m!454665))

(declare-fun m!454667 () Bool)

(assert (=> mapNonEmpty!21703 m!454667))

(declare-fun m!454669 () Bool)

(assert (=> b!473093 m!454669))

(assert (=> b!473093 m!454669))

(declare-fun m!454671 () Bool)

(assert (=> b!473093 m!454671))

(declare-fun m!454673 () Bool)

(assert (=> b!473093 m!454673))

(declare-fun m!454675 () Bool)

(assert (=> b!473093 m!454675))

(declare-fun m!454677 () Bool)

(assert (=> b!473093 m!454677))

(declare-fun m!454679 () Bool)

(assert (=> b!473093 m!454679))

(declare-fun m!454681 () Bool)

(assert (=> b!473093 m!454681))

(check-sat tp_is_empty!13327 (not b_next!11899) (not start!42410) (not b!473091) b_and!20329 (not b!473089) (not b!473094) (not mapNonEmpty!21703) (not b!473093))
(check-sat b_and!20329 (not b_next!11899))
