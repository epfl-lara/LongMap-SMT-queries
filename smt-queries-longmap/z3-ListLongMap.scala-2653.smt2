; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39722 () Bool)

(assert start!39722)

(declare-fun b_free!10003 () Bool)

(declare-fun b_next!10003 () Bool)

(assert (=> start!39722 (= b_free!10003 (not b_next!10003))))

(declare-fun tp!35537 () Bool)

(declare-fun b_and!17639 () Bool)

(assert (=> start!39722 (= tp!35537 b_and!17639)))

(declare-fun b!427242 () Bool)

(declare-fun e!253311 () Bool)

(declare-fun e!253307 () Bool)

(assert (=> b!427242 (= e!253311 e!253307)))

(declare-fun res!250644 () Bool)

(assert (=> b!427242 (=> (not res!250644) (not e!253307))))

(declare-datatypes ((array!26139 0))(
  ( (array!26140 (arr!12519 (Array (_ BitVec 32) (_ BitVec 64))) (size!12872 (_ BitVec 32))) )
))
(declare-fun lt!195090 () array!26139)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26139 (_ BitVec 32)) Bool)

(assert (=> b!427242 (= res!250644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195090 mask!1025))))

(declare-fun _keys!709 () array!26139)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427242 (= lt!195090 (array!26140 (store (arr!12519 _keys!709) i!563 k0!794) (size!12872 _keys!709)))))

(declare-fun b!427243 () Bool)

(declare-fun res!250652 () Bool)

(assert (=> b!427243 (=> (not res!250652) (not e!253307))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!427243 (= res!250652 (bvsle from!863 i!563))))

(declare-fun b!427244 () Bool)

(declare-fun res!250643 () Bool)

(assert (=> b!427244 (=> (not res!250643) (not e!253311))))

(assert (=> b!427244 (= res!250643 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12872 _keys!709))))))

(declare-fun b!427245 () Bool)

(declare-fun e!253309 () Bool)

(declare-fun tp_is_empty!11155 () Bool)

(assert (=> b!427245 (= e!253309 tp_is_empty!11155)))

(declare-fun mapIsEmpty!18354 () Bool)

(declare-fun mapRes!18354 () Bool)

(assert (=> mapIsEmpty!18354 mapRes!18354))

(declare-fun b!427246 () Bool)

(declare-fun res!250650 () Bool)

(assert (=> b!427246 (=> (not res!250650) (not e!253311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427246 (= res!250650 (validMask!0 mask!1025))))

(declare-fun res!250648 () Bool)

(assert (=> start!39722 (=> (not res!250648) (not e!253311))))

(assert (=> start!39722 (= res!250648 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12872 _keys!709))))))

(assert (=> start!39722 e!253311))

(assert (=> start!39722 tp_is_empty!11155))

(assert (=> start!39722 tp!35537))

(assert (=> start!39722 true))

(declare-datatypes ((V!15979 0))(
  ( (V!15980 (val!5622 Int)) )
))
(declare-datatypes ((ValueCell!5234 0))(
  ( (ValueCellFull!5234 (v!7863 V!15979)) (EmptyCell!5234) )
))
(declare-datatypes ((array!26141 0))(
  ( (array!26142 (arr!12520 (Array (_ BitVec 32) ValueCell!5234)) (size!12873 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26141)

(declare-fun e!253304 () Bool)

(declare-fun array_inv!9150 (array!26141) Bool)

(assert (=> start!39722 (and (array_inv!9150 _values!549) e!253304)))

(declare-fun array_inv!9151 (array!26139) Bool)

(assert (=> start!39722 (array_inv!9151 _keys!709)))

(declare-fun b!427247 () Bool)

(declare-fun res!250645 () Bool)

(assert (=> b!427247 (=> (not res!250645) (not e!253311))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!427247 (= res!250645 (and (= (size!12873 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12872 _keys!709) (size!12873 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427248 () Bool)

(declare-fun res!250651 () Bool)

(assert (=> b!427248 (=> (not res!250651) (not e!253311))))

(assert (=> b!427248 (= res!250651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427249 () Bool)

(declare-fun e!253305 () Bool)

(assert (=> b!427249 (= e!253305 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7388 0))(
  ( (tuple2!7389 (_1!3705 (_ BitVec 64)) (_2!3705 V!15979)) )
))
(declare-datatypes ((List!7392 0))(
  ( (Nil!7389) (Cons!7388 (h!8244 tuple2!7388) (t!12835 List!7392)) )
))
(declare-datatypes ((ListLongMap!6291 0))(
  ( (ListLongMap!6292 (toList!3161 List!7392)) )
))
(declare-fun lt!195094 () ListLongMap!6291)

(declare-fun lt!195095 () ListLongMap!6291)

(declare-fun +!1340 (ListLongMap!6291 tuple2!7388) ListLongMap!6291)

(declare-fun get!6191 (ValueCell!5234 V!15979) V!15979)

(declare-fun dynLambda!739 (Int (_ BitVec 64)) V!15979)

(assert (=> b!427249 (= lt!195095 (+!1340 lt!195094 (tuple2!7389 (select (arr!12519 _keys!709) from!863) (get!6191 (select (arr!12520 _values!549) from!863) (dynLambda!739 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427250 () Bool)

(declare-fun res!250649 () Bool)

(assert (=> b!427250 (=> (not res!250649) (not e!253311))))

(assert (=> b!427250 (= res!250649 (or (= (select (arr!12519 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12519 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427251 () Bool)

(declare-fun res!250640 () Bool)

(assert (=> b!427251 (=> (not res!250640) (not e!253311))))

(declare-fun arrayContainsKey!0 (array!26139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427251 (= res!250640 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427252 () Bool)

(declare-fun e!253310 () Bool)

(assert (=> b!427252 (= e!253310 tp_is_empty!11155)))

(declare-fun b!427253 () Bool)

(declare-fun res!250653 () Bool)

(assert (=> b!427253 (=> (not res!250653) (not e!253311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427253 (= res!250653 (validKeyInArray!0 k0!794))))

(declare-fun b!427254 () Bool)

(declare-fun res!250642 () Bool)

(assert (=> b!427254 (=> (not res!250642) (not e!253311))))

(declare-datatypes ((List!7393 0))(
  ( (Nil!7390) (Cons!7389 (h!8245 (_ BitVec 64)) (t!12836 List!7393)) )
))
(declare-fun arrayNoDuplicates!0 (array!26139 (_ BitVec 32) List!7393) Bool)

(assert (=> b!427254 (= res!250642 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7390))))

(declare-fun mapNonEmpty!18354 () Bool)

(declare-fun tp!35538 () Bool)

(assert (=> mapNonEmpty!18354 (= mapRes!18354 (and tp!35538 e!253309))))

(declare-fun mapKey!18354 () (_ BitVec 32))

(declare-fun mapValue!18354 () ValueCell!5234)

(declare-fun mapRest!18354 () (Array (_ BitVec 32) ValueCell!5234))

(assert (=> mapNonEmpty!18354 (= (arr!12520 _values!549) (store mapRest!18354 mapKey!18354 mapValue!18354))))

(declare-fun b!427255 () Bool)

(declare-fun e!253308 () Bool)

(assert (=> b!427255 (= e!253308 (not e!253305))))

(declare-fun res!250641 () Bool)

(assert (=> b!427255 (=> res!250641 e!253305)))

(assert (=> b!427255 (= res!250641 (not (validKeyInArray!0 (select (arr!12519 _keys!709) from!863))))))

(declare-fun lt!195091 () ListLongMap!6291)

(assert (=> b!427255 (= lt!195091 lt!195094)))

(declare-fun lt!195092 () ListLongMap!6291)

(declare-fun v!412 () V!15979)

(assert (=> b!427255 (= lt!195094 (+!1340 lt!195092 (tuple2!7389 k0!794 v!412)))))

(declare-fun minValue!515 () V!15979)

(declare-fun zeroValue!515 () V!15979)

(declare-fun lt!195088 () array!26141)

(declare-fun getCurrentListMapNoExtraKeys!1369 (array!26139 array!26141 (_ BitVec 32) (_ BitVec 32) V!15979 V!15979 (_ BitVec 32) Int) ListLongMap!6291)

(assert (=> b!427255 (= lt!195091 (getCurrentListMapNoExtraKeys!1369 lt!195090 lt!195088 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427255 (= lt!195092 (getCurrentListMapNoExtraKeys!1369 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12526 0))(
  ( (Unit!12527) )
))
(declare-fun lt!195093 () Unit!12526)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!511 (array!26139 array!26141 (_ BitVec 32) (_ BitVec 32) V!15979 V!15979 (_ BitVec 32) (_ BitVec 64) V!15979 (_ BitVec 32) Int) Unit!12526)

(assert (=> b!427255 (= lt!195093 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!511 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427256 () Bool)

(assert (=> b!427256 (= e!253307 e!253308)))

(declare-fun res!250646 () Bool)

(assert (=> b!427256 (=> (not res!250646) (not e!253308))))

(assert (=> b!427256 (= res!250646 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!427256 (= lt!195095 (getCurrentListMapNoExtraKeys!1369 lt!195090 lt!195088 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!427256 (= lt!195088 (array!26142 (store (arr!12520 _values!549) i!563 (ValueCellFull!5234 v!412)) (size!12873 _values!549)))))

(declare-fun lt!195089 () ListLongMap!6291)

(assert (=> b!427256 (= lt!195089 (getCurrentListMapNoExtraKeys!1369 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427257 () Bool)

(declare-fun res!250647 () Bool)

(assert (=> b!427257 (=> (not res!250647) (not e!253307))))

(assert (=> b!427257 (= res!250647 (arrayNoDuplicates!0 lt!195090 #b00000000000000000000000000000000 Nil!7390))))

(declare-fun b!427258 () Bool)

(assert (=> b!427258 (= e!253304 (and e!253310 mapRes!18354))))

(declare-fun condMapEmpty!18354 () Bool)

(declare-fun mapDefault!18354 () ValueCell!5234)

(assert (=> b!427258 (= condMapEmpty!18354 (= (arr!12520 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5234)) mapDefault!18354)))))

(assert (= (and start!39722 res!250648) b!427246))

(assert (= (and b!427246 res!250650) b!427247))

(assert (= (and b!427247 res!250645) b!427248))

(assert (= (and b!427248 res!250651) b!427254))

(assert (= (and b!427254 res!250642) b!427244))

(assert (= (and b!427244 res!250643) b!427253))

(assert (= (and b!427253 res!250653) b!427250))

(assert (= (and b!427250 res!250649) b!427251))

(assert (= (and b!427251 res!250640) b!427242))

(assert (= (and b!427242 res!250644) b!427257))

(assert (= (and b!427257 res!250647) b!427243))

(assert (= (and b!427243 res!250652) b!427256))

(assert (= (and b!427256 res!250646) b!427255))

(assert (= (and b!427255 (not res!250641)) b!427249))

(assert (= (and b!427258 condMapEmpty!18354) mapIsEmpty!18354))

(assert (= (and b!427258 (not condMapEmpty!18354)) mapNonEmpty!18354))

(get-info :version)

(assert (= (and mapNonEmpty!18354 ((_ is ValueCellFull!5234) mapValue!18354)) b!427245))

(assert (= (and b!427258 ((_ is ValueCellFull!5234) mapDefault!18354)) b!427252))

(assert (= start!39722 b!427258))

(declare-fun b_lambda!9073 () Bool)

(assert (=> (not b_lambda!9073) (not b!427249)))

(declare-fun t!12834 () Bool)

(declare-fun tb!3401 () Bool)

(assert (=> (and start!39722 (= defaultEntry!557 defaultEntry!557) t!12834) tb!3401))

(declare-fun result!6337 () Bool)

(assert (=> tb!3401 (= result!6337 tp_is_empty!11155)))

(assert (=> b!427249 t!12834))

(declare-fun b_and!17641 () Bool)

(assert (= b_and!17639 (and (=> t!12834 result!6337) b_and!17641)))

(declare-fun m!415275 () Bool)

(assert (=> b!427257 m!415275))

(declare-fun m!415277 () Bool)

(assert (=> b!427248 m!415277))

(declare-fun m!415279 () Bool)

(assert (=> b!427253 m!415279))

(declare-fun m!415281 () Bool)

(assert (=> mapNonEmpty!18354 m!415281))

(declare-fun m!415283 () Bool)

(assert (=> b!427246 m!415283))

(declare-fun m!415285 () Bool)

(assert (=> b!427256 m!415285))

(declare-fun m!415287 () Bool)

(assert (=> b!427256 m!415287))

(declare-fun m!415289 () Bool)

(assert (=> b!427256 m!415289))

(declare-fun m!415291 () Bool)

(assert (=> b!427249 m!415291))

(declare-fun m!415293 () Bool)

(assert (=> b!427249 m!415293))

(declare-fun m!415295 () Bool)

(assert (=> b!427249 m!415295))

(declare-fun m!415297 () Bool)

(assert (=> b!427249 m!415297))

(assert (=> b!427249 m!415297))

(assert (=> b!427249 m!415295))

(declare-fun m!415299 () Bool)

(assert (=> b!427249 m!415299))

(declare-fun m!415301 () Bool)

(assert (=> b!427250 m!415301))

(assert (=> b!427255 m!415291))

(declare-fun m!415303 () Bool)

(assert (=> b!427255 m!415303))

(declare-fun m!415305 () Bool)

(assert (=> b!427255 m!415305))

(declare-fun m!415307 () Bool)

(assert (=> b!427255 m!415307))

(assert (=> b!427255 m!415291))

(declare-fun m!415309 () Bool)

(assert (=> b!427255 m!415309))

(declare-fun m!415311 () Bool)

(assert (=> b!427255 m!415311))

(declare-fun m!415313 () Bool)

(assert (=> b!427242 m!415313))

(declare-fun m!415315 () Bool)

(assert (=> b!427242 m!415315))

(declare-fun m!415317 () Bool)

(assert (=> b!427251 m!415317))

(declare-fun m!415319 () Bool)

(assert (=> start!39722 m!415319))

(declare-fun m!415321 () Bool)

(assert (=> start!39722 m!415321))

(declare-fun m!415323 () Bool)

(assert (=> b!427254 m!415323))

(check-sat (not b_lambda!9073) (not start!39722) tp_is_empty!11155 (not b!427242) (not b!427248) (not b!427253) (not b!427257) (not b!427249) (not b!427256) (not b!427251) b_and!17641 (not b!427246) (not b!427254) (not mapNonEmpty!18354) (not b_next!10003) (not b!427255))
(check-sat b_and!17641 (not b_next!10003))
