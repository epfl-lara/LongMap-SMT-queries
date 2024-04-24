; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39572 () Bool)

(assert start!39572)

(declare-fun b_free!9853 () Bool)

(declare-fun b_next!9853 () Bool)

(assert (=> start!39572 (= b_free!9853 (not b_next!9853))))

(declare-fun tp!35087 () Bool)

(declare-fun b_and!17523 () Bool)

(assert (=> start!39572 (= tp!35087 b_and!17523)))

(declare-fun mapIsEmpty!18129 () Bool)

(declare-fun mapRes!18129 () Bool)

(assert (=> mapIsEmpty!18129 mapRes!18129))

(declare-fun b!423890 () Bool)

(declare-fun res!247881 () Bool)

(declare-fun e!251908 () Bool)

(assert (=> b!423890 (=> (not res!247881) (not e!251908))))

(declare-datatypes ((array!25860 0))(
  ( (array!25861 (arr!12379 (Array (_ BitVec 32) (_ BitVec 64))) (size!12731 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25860)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423890 (= res!247881 (or (= (select (arr!12379 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12379 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423891 () Bool)

(declare-fun res!247884 () Bool)

(assert (=> b!423891 (=> (not res!247884) (not e!251908))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15779 0))(
  ( (V!15780 (val!5547 Int)) )
))
(declare-datatypes ((ValueCell!5159 0))(
  ( (ValueCellFull!5159 (v!7795 V!15779)) (EmptyCell!5159) )
))
(declare-datatypes ((array!25862 0))(
  ( (array!25863 (arr!12380 (Array (_ BitVec 32) ValueCell!5159)) (size!12732 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25862)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!423891 (= res!247884 (and (= (size!12732 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12731 _keys!709) (size!12732 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423892 () Bool)

(declare-fun res!247877 () Bool)

(assert (=> b!423892 (=> (not res!247877) (not e!251908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423892 (= res!247877 (validMask!0 mask!1025))))

(declare-fun b!423893 () Bool)

(declare-fun e!251904 () Bool)

(assert (=> b!423893 (= e!251908 e!251904)))

(declare-fun res!247873 () Bool)

(assert (=> b!423893 (=> (not res!247873) (not e!251904))))

(declare-fun lt!194289 () array!25860)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25860 (_ BitVec 32)) Bool)

(assert (=> b!423893 (= res!247873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194289 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!423893 (= lt!194289 (array!25861 (store (arr!12379 _keys!709) i!563 k0!794) (size!12731 _keys!709)))))

(declare-fun b!423894 () Bool)

(declare-fun e!251905 () Bool)

(declare-fun tp_is_empty!11005 () Bool)

(assert (=> b!423894 (= e!251905 tp_is_empty!11005)))

(declare-fun b!423895 () Bool)

(declare-fun res!247880 () Bool)

(assert (=> b!423895 (=> (not res!247880) (not e!251908))))

(declare-datatypes ((List!7175 0))(
  ( (Nil!7172) (Cons!7171 (h!8027 (_ BitVec 64)) (t!12611 List!7175)) )
))
(declare-fun arrayNoDuplicates!0 (array!25860 (_ BitVec 32) List!7175) Bool)

(assert (=> b!423895 (= res!247880 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7172))))

(declare-fun b!423896 () Bool)

(declare-fun res!247874 () Bool)

(assert (=> b!423896 (=> (not res!247874) (not e!251908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423896 (= res!247874 (validKeyInArray!0 k0!794))))

(declare-fun b!423897 () Bool)

(declare-fun res!247879 () Bool)

(assert (=> b!423897 (=> (not res!247879) (not e!251904))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!423897 (= res!247879 (bvsle from!863 i!563))))

(declare-fun b!423898 () Bool)

(declare-fun res!247882 () Bool)

(assert (=> b!423898 (=> (not res!247882) (not e!251908))))

(assert (=> b!423898 (= res!247882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423899 () Bool)

(declare-fun res!247878 () Bool)

(assert (=> b!423899 (=> (not res!247878) (not e!251908))))

(declare-fun arrayContainsKey!0 (array!25860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423899 (= res!247878 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423900 () Bool)

(declare-fun e!251903 () Bool)

(assert (=> b!423900 (= e!251903 tp_is_empty!11005)))

(declare-fun b!423901 () Bool)

(declare-fun res!247875 () Bool)

(assert (=> b!423901 (=> (not res!247875) (not e!251904))))

(assert (=> b!423901 (= res!247875 (arrayNoDuplicates!0 lt!194289 #b00000000000000000000000000000000 Nil!7172))))

(declare-fun b!423902 () Bool)

(declare-fun res!247876 () Bool)

(assert (=> b!423902 (=> (not res!247876) (not e!251908))))

(assert (=> b!423902 (= res!247876 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12731 _keys!709))))))

(declare-fun b!423903 () Bool)

(declare-fun e!251907 () Bool)

(assert (=> b!423903 (= e!251907 (and e!251905 mapRes!18129))))

(declare-fun condMapEmpty!18129 () Bool)

(declare-fun mapDefault!18129 () ValueCell!5159)

(assert (=> b!423903 (= condMapEmpty!18129 (= (arr!12380 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5159)) mapDefault!18129)))))

(declare-fun res!247883 () Bool)

(assert (=> start!39572 (=> (not res!247883) (not e!251908))))

(assert (=> start!39572 (= res!247883 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12731 _keys!709))))))

(assert (=> start!39572 e!251908))

(assert (=> start!39572 tp_is_empty!11005))

(assert (=> start!39572 tp!35087))

(assert (=> start!39572 true))

(declare-fun array_inv!9092 (array!25862) Bool)

(assert (=> start!39572 (and (array_inv!9092 _values!549) e!251907)))

(declare-fun array_inv!9093 (array!25860) Bool)

(assert (=> start!39572 (array_inv!9093 _keys!709)))

(declare-fun b!423904 () Bool)

(assert (=> b!423904 (= e!251904 false)))

(declare-fun minValue!515 () V!15779)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15779)

(declare-datatypes ((tuple2!7168 0))(
  ( (tuple2!7169 (_1!3595 (_ BitVec 64)) (_2!3595 V!15779)) )
))
(declare-datatypes ((List!7176 0))(
  ( (Nil!7173) (Cons!7172 (h!8028 tuple2!7168) (t!12612 List!7176)) )
))
(declare-datatypes ((ListLongMap!6083 0))(
  ( (ListLongMap!6084 (toList!3057 List!7176)) )
))
(declare-fun lt!194288 () ListLongMap!6083)

(declare-fun v!412 () V!15779)

(declare-fun getCurrentListMapNoExtraKeys!1303 (array!25860 array!25862 (_ BitVec 32) (_ BitVec 32) V!15779 V!15779 (_ BitVec 32) Int) ListLongMap!6083)

(assert (=> b!423904 (= lt!194288 (getCurrentListMapNoExtraKeys!1303 lt!194289 (array!25863 (store (arr!12380 _values!549) i!563 (ValueCellFull!5159 v!412)) (size!12732 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194287 () ListLongMap!6083)

(assert (=> b!423904 (= lt!194287 (getCurrentListMapNoExtraKeys!1303 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18129 () Bool)

(declare-fun tp!35088 () Bool)

(assert (=> mapNonEmpty!18129 (= mapRes!18129 (and tp!35088 e!251903))))

(declare-fun mapKey!18129 () (_ BitVec 32))

(declare-fun mapRest!18129 () (Array (_ BitVec 32) ValueCell!5159))

(declare-fun mapValue!18129 () ValueCell!5159)

(assert (=> mapNonEmpty!18129 (= (arr!12380 _values!549) (store mapRest!18129 mapKey!18129 mapValue!18129))))

(assert (= (and start!39572 res!247883) b!423892))

(assert (= (and b!423892 res!247877) b!423891))

(assert (= (and b!423891 res!247884) b!423898))

(assert (= (and b!423898 res!247882) b!423895))

(assert (= (and b!423895 res!247880) b!423902))

(assert (= (and b!423902 res!247876) b!423896))

(assert (= (and b!423896 res!247874) b!423890))

(assert (= (and b!423890 res!247881) b!423899))

(assert (= (and b!423899 res!247878) b!423893))

(assert (= (and b!423893 res!247873) b!423901))

(assert (= (and b!423901 res!247875) b!423897))

(assert (= (and b!423897 res!247879) b!423904))

(assert (= (and b!423903 condMapEmpty!18129) mapIsEmpty!18129))

(assert (= (and b!423903 (not condMapEmpty!18129)) mapNonEmpty!18129))

(get-info :version)

(assert (= (and mapNonEmpty!18129 ((_ is ValueCellFull!5159) mapValue!18129)) b!423900))

(assert (= (and b!423903 ((_ is ValueCellFull!5159) mapDefault!18129)) b!423894))

(assert (= start!39572 b!423903))

(declare-fun m!413471 () Bool)

(assert (=> b!423898 m!413471))

(declare-fun m!413473 () Bool)

(assert (=> b!423893 m!413473))

(declare-fun m!413475 () Bool)

(assert (=> b!423893 m!413475))

(declare-fun m!413477 () Bool)

(assert (=> start!39572 m!413477))

(declare-fun m!413479 () Bool)

(assert (=> start!39572 m!413479))

(declare-fun m!413481 () Bool)

(assert (=> b!423904 m!413481))

(declare-fun m!413483 () Bool)

(assert (=> b!423904 m!413483))

(declare-fun m!413485 () Bool)

(assert (=> b!423904 m!413485))

(declare-fun m!413487 () Bool)

(assert (=> b!423899 m!413487))

(declare-fun m!413489 () Bool)

(assert (=> b!423895 m!413489))

(declare-fun m!413491 () Bool)

(assert (=> b!423890 m!413491))

(declare-fun m!413493 () Bool)

(assert (=> b!423896 m!413493))

(declare-fun m!413495 () Bool)

(assert (=> b!423901 m!413495))

(declare-fun m!413497 () Bool)

(assert (=> b!423892 m!413497))

(declare-fun m!413499 () Bool)

(assert (=> mapNonEmpty!18129 m!413499))

(check-sat (not b!423899) (not b_next!9853) (not b!423895) b_and!17523 (not b!423896) (not b!423904) (not b!423892) (not mapNonEmpty!18129) (not b!423893) (not b!423901) (not b!423898) (not start!39572) tp_is_empty!11005)
(check-sat b_and!17523 (not b_next!9853))
