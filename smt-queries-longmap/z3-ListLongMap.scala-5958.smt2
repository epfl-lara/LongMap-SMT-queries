; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77576 () Bool)

(assert start!77576)

(declare-fun b_free!16161 () Bool)

(declare-fun b_next!16161 () Bool)

(assert (=> start!77576 (= b_free!16161 (not b_next!16161))))

(declare-fun tp!56744 () Bool)

(declare-fun b_and!26527 () Bool)

(assert (=> start!77576 (= tp!56744 b_and!26527)))

(declare-fun mapIsEmpty!29581 () Bool)

(declare-fun mapRes!29581 () Bool)

(assert (=> mapIsEmpty!29581 mapRes!29581))

(declare-fun b!903939 () Bool)

(declare-fun e!506508 () Bool)

(declare-fun tp_is_empty!18579 () Bool)

(assert (=> b!903939 (= e!506508 tp_is_empty!18579)))

(declare-fun b!903940 () Bool)

(declare-fun res!609880 () Bool)

(declare-fun e!506504 () Bool)

(assert (=> b!903940 (=> (not res!609880) (not e!506504))))

(declare-datatypes ((V!29737 0))(
  ( (V!29738 (val!9340 Int)) )
))
(declare-datatypes ((ValueCell!8808 0))(
  ( (ValueCellFull!8808 (v!11845 V!29737)) (EmptyCell!8808) )
))
(declare-datatypes ((array!53210 0))(
  ( (array!53211 (arr!25564 (Array (_ BitVec 32) ValueCell!8808)) (size!26023 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53210)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29737)

(declare-datatypes ((array!53212 0))(
  ( (array!53213 (arr!25565 (Array (_ BitVec 32) (_ BitVec 64))) (size!26024 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53212)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29737)

(declare-datatypes ((tuple2!12134 0))(
  ( (tuple2!12135 (_1!6078 (_ BitVec 64)) (_2!6078 V!29737)) )
))
(declare-datatypes ((List!17953 0))(
  ( (Nil!17950) (Cons!17949 (h!19095 tuple2!12134) (t!25336 List!17953)) )
))
(declare-datatypes ((ListLongMap!10831 0))(
  ( (ListLongMap!10832 (toList!5431 List!17953)) )
))
(declare-fun contains!4479 (ListLongMap!10831 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2700 (array!53212 array!53210 (_ BitVec 32) (_ BitVec 32) V!29737 V!29737 (_ BitVec 32) Int) ListLongMap!10831)

(assert (=> b!903940 (= res!609880 (contains!4479 (getCurrentListMap!2700 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903941 () Bool)

(declare-fun e!506506 () Bool)

(declare-fun e!506502 () Bool)

(assert (=> b!903941 (= e!506506 e!506502)))

(declare-fun res!609879 () Bool)

(assert (=> b!903941 (=> res!609879 e!506502)))

(declare-fun lt!408109 () ListLongMap!10831)

(assert (=> b!903941 (= res!609879 (not (contains!4479 lt!408109 k0!1033)))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!903941 (= lt!408109 (getCurrentListMap!2700 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!609884 () Bool)

(assert (=> start!77576 (=> (not res!609884) (not e!506504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77576 (= res!609884 (validMask!0 mask!1756))))

(assert (=> start!77576 e!506504))

(declare-fun e!506503 () Bool)

(declare-fun array_inv!20030 (array!53210) Bool)

(assert (=> start!77576 (and (array_inv!20030 _values!1152) e!506503)))

(assert (=> start!77576 tp!56744))

(assert (=> start!77576 true))

(assert (=> start!77576 tp_is_empty!18579))

(declare-fun array_inv!20031 (array!53212) Bool)

(assert (=> start!77576 (array_inv!20031 _keys!1386)))

(declare-fun b!903942 () Bool)

(declare-fun res!609881 () Bool)

(assert (=> b!903942 (=> (not res!609881) (not e!506504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53212 (_ BitVec 32)) Bool)

(assert (=> b!903942 (= res!609881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903943 () Bool)

(declare-fun res!609877 () Bool)

(assert (=> b!903943 (=> (not res!609877) (not e!506504))))

(declare-datatypes ((List!17954 0))(
  ( (Nil!17951) (Cons!17950 (h!19096 (_ BitVec 64)) (t!25337 List!17954)) )
))
(declare-fun arrayNoDuplicates!0 (array!53212 (_ BitVec 32) List!17954) Bool)

(assert (=> b!903943 (= res!609877 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17951))))

(declare-fun b!903944 () Bool)

(declare-fun e!506507 () Bool)

(assert (=> b!903944 (= e!506507 tp_is_empty!18579)))

(declare-fun b!903945 () Bool)

(assert (=> b!903945 (= e!506502 true)))

(declare-fun lt!408111 () V!29737)

(declare-fun apply!428 (ListLongMap!10831 (_ BitVec 64)) V!29737)

(assert (=> b!903945 (= lt!408111 (apply!428 lt!408109 k0!1033))))

(declare-fun b!903946 () Bool)

(declare-fun res!609878 () Bool)

(assert (=> b!903946 (=> (not res!609878) (not e!506504))))

(assert (=> b!903946 (= res!609878 (and (= (size!26023 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26024 _keys!1386) (size!26023 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903947 () Bool)

(assert (=> b!903947 (= e!506504 (not e!506506))))

(declare-fun res!609883 () Bool)

(assert (=> b!903947 (=> res!609883 e!506506)))

(assert (=> b!903947 (= res!609883 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26024 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903947 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30658 0))(
  ( (Unit!30659) )
))
(declare-fun lt!408110 () Unit!30658)

(declare-fun lemmaKeyInListMapIsInArray!172 (array!53212 array!53210 (_ BitVec 32) (_ BitVec 32) V!29737 V!29737 (_ BitVec 64) Int) Unit!30658)

(assert (=> b!903947 (= lt!408110 (lemmaKeyInListMapIsInArray!172 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!903948 () Bool)

(declare-fun res!609876 () Bool)

(assert (=> b!903948 (=> (not res!609876) (not e!506504))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903948 (= res!609876 (inRange!0 i!717 mask!1756))))

(declare-fun b!903949 () Bool)

(declare-fun res!609882 () Bool)

(assert (=> b!903949 (=> (not res!609882) (not e!506504))))

(assert (=> b!903949 (= res!609882 (and (= (select (arr!25565 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29581 () Bool)

(declare-fun tp!56745 () Bool)

(assert (=> mapNonEmpty!29581 (= mapRes!29581 (and tp!56745 e!506508))))

(declare-fun mapValue!29581 () ValueCell!8808)

(declare-fun mapRest!29581 () (Array (_ BitVec 32) ValueCell!8808))

(declare-fun mapKey!29581 () (_ BitVec 32))

(assert (=> mapNonEmpty!29581 (= (arr!25564 _values!1152) (store mapRest!29581 mapKey!29581 mapValue!29581))))

(declare-fun b!903950 () Bool)

(assert (=> b!903950 (= e!506503 (and e!506507 mapRes!29581))))

(declare-fun condMapEmpty!29581 () Bool)

(declare-fun mapDefault!29581 () ValueCell!8808)

(assert (=> b!903950 (= condMapEmpty!29581 (= (arr!25564 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8808)) mapDefault!29581)))))

(assert (= (and start!77576 res!609884) b!903946))

(assert (= (and b!903946 res!609878) b!903942))

(assert (= (and b!903942 res!609881) b!903943))

(assert (= (and b!903943 res!609877) b!903940))

(assert (= (and b!903940 res!609880) b!903948))

(assert (= (and b!903948 res!609876) b!903949))

(assert (= (and b!903949 res!609882) b!903947))

(assert (= (and b!903947 (not res!609883)) b!903941))

(assert (= (and b!903941 (not res!609879)) b!903945))

(assert (= (and b!903950 condMapEmpty!29581) mapIsEmpty!29581))

(assert (= (and b!903950 (not condMapEmpty!29581)) mapNonEmpty!29581))

(get-info :version)

(assert (= (and mapNonEmpty!29581 ((_ is ValueCellFull!8808) mapValue!29581)) b!903939))

(assert (= (and b!903950 ((_ is ValueCellFull!8808) mapDefault!29581)) b!903944))

(assert (= start!77576 b!903950))

(declare-fun m!839515 () Bool)

(assert (=> b!903949 m!839515))

(declare-fun m!839517 () Bool)

(assert (=> b!903945 m!839517))

(declare-fun m!839519 () Bool)

(assert (=> b!903941 m!839519))

(declare-fun m!839521 () Bool)

(assert (=> b!903941 m!839521))

(declare-fun m!839523 () Bool)

(assert (=> start!77576 m!839523))

(declare-fun m!839525 () Bool)

(assert (=> start!77576 m!839525))

(declare-fun m!839527 () Bool)

(assert (=> start!77576 m!839527))

(declare-fun m!839529 () Bool)

(assert (=> b!903940 m!839529))

(assert (=> b!903940 m!839529))

(declare-fun m!839531 () Bool)

(assert (=> b!903940 m!839531))

(declare-fun m!839533 () Bool)

(assert (=> b!903943 m!839533))

(declare-fun m!839535 () Bool)

(assert (=> b!903948 m!839535))

(declare-fun m!839537 () Bool)

(assert (=> b!903947 m!839537))

(declare-fun m!839539 () Bool)

(assert (=> b!903947 m!839539))

(declare-fun m!839541 () Bool)

(assert (=> mapNonEmpty!29581 m!839541))

(declare-fun m!839543 () Bool)

(assert (=> b!903942 m!839543))

(check-sat (not b!903942) (not mapNonEmpty!29581) (not b!903940) (not b!903941) b_and!26527 (not b!903945) (not b!903943) (not b!903948) tp_is_empty!18579 (not start!77576) (not b!903947) (not b_next!16161))
(check-sat b_and!26527 (not b_next!16161))
