; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43442 () Bool)

(assert start!43442)

(declare-fun b_free!12235 () Bool)

(declare-fun b_next!12235 () Bool)

(assert (=> start!43442 (= b_free!12235 (not b_next!12235))))

(declare-fun tp!42988 () Bool)

(declare-fun b_and!20969 () Bool)

(assert (=> start!43442 (= tp!42988 b_and!20969)))

(declare-fun b!481080 () Bool)

(declare-fun e!283050 () Bool)

(declare-fun e!283051 () Bool)

(declare-fun mapRes!22330 () Bool)

(assert (=> b!481080 (= e!283050 (and e!283051 mapRes!22330))))

(declare-fun condMapEmpty!22330 () Bool)

(declare-datatypes ((V!19401 0))(
  ( (V!19402 (val!6921 Int)) )
))
(declare-datatypes ((ValueCell!6512 0))(
  ( (ValueCellFull!6512 (v!9208 V!19401)) (EmptyCell!6512) )
))
(declare-datatypes ((array!31159 0))(
  ( (array!31160 (arr!14982 (Array (_ BitVec 32) ValueCell!6512)) (size!15341 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31159)

(declare-fun mapDefault!22330 () ValueCell!6512)

(assert (=> b!481080 (= condMapEmpty!22330 (= (arr!14982 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6512)) mapDefault!22330)))))

(declare-fun b!481081 () Bool)

(declare-fun res!286850 () Bool)

(declare-fun e!283053 () Bool)

(assert (=> b!481081 (=> (not res!286850) (not e!283053))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481081 (= res!286850 (validKeyInArray!0 k0!1332))))

(declare-fun mapIsEmpty!22330 () Bool)

(assert (=> mapIsEmpty!22330 mapRes!22330))

(declare-fun res!286848 () Bool)

(assert (=> start!43442 (=> (not res!286848) (not e!283053))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43442 (= res!286848 (validMask!0 mask!2352))))

(assert (=> start!43442 e!283053))

(assert (=> start!43442 true))

(declare-fun tp_is_empty!13747 () Bool)

(assert (=> start!43442 tp_is_empty!13747))

(declare-fun array_inv!10898 (array!31159) Bool)

(assert (=> start!43442 (and (array_inv!10898 _values!1516) e!283050)))

(assert (=> start!43442 tp!42988))

(declare-datatypes ((array!31161 0))(
  ( (array!31162 (arr!14983 (Array (_ BitVec 32) (_ BitVec 64))) (size!15342 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31161)

(declare-fun array_inv!10899 (array!31161) Bool)

(assert (=> start!43442 (array_inv!10899 _keys!1874)))

(declare-fun b!481082 () Bool)

(assert (=> b!481082 (= e!283053 (not true))))

(declare-fun lt!218270 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31161 (_ BitVec 32)) Bool)

(assert (=> b!481082 (arrayForallSeekEntryOrOpenFound!0 lt!218270 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14102 0))(
  ( (Unit!14103) )
))
(declare-fun lt!218271 () Unit!14102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14102)

(assert (=> b!481082 (= lt!218271 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218270))))

(declare-fun arrayScanForKey!0 (array!31161 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481082 (= lt!218270 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283048 () Bool)

(assert (=> b!481082 e!283048))

(declare-fun c!57835 () Bool)

(assert (=> b!481082 (= c!57835 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19401)

(declare-fun lt!218272 () Unit!14102)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19401)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!138 (array!31161 array!31159 (_ BitVec 32) (_ BitVec 32) V!19401 V!19401 (_ BitVec 64) Int) Unit!14102)

(assert (=> b!481082 (= lt!218272 (lemmaKeyInListMapIsInArray!138 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun mapNonEmpty!22330 () Bool)

(declare-fun tp!42987 () Bool)

(declare-fun e!283052 () Bool)

(assert (=> mapNonEmpty!22330 (= mapRes!22330 (and tp!42987 e!283052))))

(declare-fun mapRest!22330 () (Array (_ BitVec 32) ValueCell!6512))

(declare-fun mapValue!22330 () ValueCell!6512)

(declare-fun mapKey!22330 () (_ BitVec 32))

(assert (=> mapNonEmpty!22330 (= (arr!14982 _values!1516) (store mapRest!22330 mapKey!22330 mapValue!22330))))

(declare-fun b!481083 () Bool)

(assert (=> b!481083 (= e!283048 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481084 () Bool)

(assert (=> b!481084 (= e!283051 tp_is_empty!13747)))

(declare-fun b!481085 () Bool)

(declare-fun res!286851 () Bool)

(assert (=> b!481085 (=> (not res!286851) (not e!283053))))

(declare-datatypes ((tuple2!9134 0))(
  ( (tuple2!9135 (_1!4578 (_ BitVec 64)) (_2!4578 V!19401)) )
))
(declare-datatypes ((List!9198 0))(
  ( (Nil!9195) (Cons!9194 (h!10050 tuple2!9134) (t!15403 List!9198)) )
))
(declare-datatypes ((ListLongMap!8037 0))(
  ( (ListLongMap!8038 (toList!4034 List!9198)) )
))
(declare-fun contains!2613 (ListLongMap!8037 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2287 (array!31161 array!31159 (_ BitVec 32) (_ BitVec 32) V!19401 V!19401 (_ BitVec 32) Int) ListLongMap!8037)

(assert (=> b!481085 (= res!286851 (contains!2613 (getCurrentListMap!2287 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481086 () Bool)

(assert (=> b!481086 (= e!283052 tp_is_empty!13747)))

(declare-fun b!481087 () Bool)

(declare-fun res!286847 () Bool)

(assert (=> b!481087 (=> (not res!286847) (not e!283053))))

(assert (=> b!481087 (= res!286847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481088 () Bool)

(declare-fun arrayContainsKey!0 (array!31161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481088 (= e!283048 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481089 () Bool)

(declare-fun res!286849 () Bool)

(assert (=> b!481089 (=> (not res!286849) (not e!283053))))

(declare-datatypes ((List!9199 0))(
  ( (Nil!9196) (Cons!9195 (h!10051 (_ BitVec 64)) (t!15404 List!9199)) )
))
(declare-fun arrayNoDuplicates!0 (array!31161 (_ BitVec 32) List!9199) Bool)

(assert (=> b!481089 (= res!286849 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9196))))

(declare-fun b!481090 () Bool)

(declare-fun res!286852 () Bool)

(assert (=> b!481090 (=> (not res!286852) (not e!283053))))

(assert (=> b!481090 (= res!286852 (and (= (size!15341 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15342 _keys!1874) (size!15341 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43442 res!286848) b!481090))

(assert (= (and b!481090 res!286852) b!481087))

(assert (= (and b!481087 res!286847) b!481089))

(assert (= (and b!481089 res!286849) b!481085))

(assert (= (and b!481085 res!286851) b!481081))

(assert (= (and b!481081 res!286850) b!481082))

(assert (= (and b!481082 c!57835) b!481088))

(assert (= (and b!481082 (not c!57835)) b!481083))

(assert (= (and b!481080 condMapEmpty!22330) mapIsEmpty!22330))

(assert (= (and b!481080 (not condMapEmpty!22330)) mapNonEmpty!22330))

(get-info :version)

(assert (= (and mapNonEmpty!22330 ((_ is ValueCellFull!6512) mapValue!22330)) b!481086))

(assert (= (and b!481080 ((_ is ValueCellFull!6512) mapDefault!22330)) b!481084))

(assert (= start!43442 b!481080))

(declare-fun m!462081 () Bool)

(assert (=> b!481088 m!462081))

(declare-fun m!462083 () Bool)

(assert (=> start!43442 m!462083))

(declare-fun m!462085 () Bool)

(assert (=> start!43442 m!462085))

(declare-fun m!462087 () Bool)

(assert (=> start!43442 m!462087))

(declare-fun m!462089 () Bool)

(assert (=> b!481085 m!462089))

(assert (=> b!481085 m!462089))

(declare-fun m!462091 () Bool)

(assert (=> b!481085 m!462091))

(declare-fun m!462093 () Bool)

(assert (=> b!481082 m!462093))

(declare-fun m!462095 () Bool)

(assert (=> b!481082 m!462095))

(declare-fun m!462097 () Bool)

(assert (=> b!481082 m!462097))

(declare-fun m!462099 () Bool)

(assert (=> b!481082 m!462099))

(declare-fun m!462101 () Bool)

(assert (=> mapNonEmpty!22330 m!462101))

(declare-fun m!462103 () Bool)

(assert (=> b!481089 m!462103))

(declare-fun m!462105 () Bool)

(assert (=> b!481081 m!462105))

(declare-fun m!462107 () Bool)

(assert (=> b!481087 m!462107))

(check-sat (not start!43442) (not b!481081) b_and!20969 (not b!481089) (not b!481085) (not mapNonEmpty!22330) (not b!481088) (not b!481087) (not b!481082) (not b_next!12235) tp_is_empty!13747)
(check-sat b_and!20969 (not b_next!12235))
