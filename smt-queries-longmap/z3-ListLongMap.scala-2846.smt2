; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41064 () Bool)

(assert start!41064)

(declare-fun b_free!10977 () Bool)

(declare-fun b_next!10977 () Bool)

(assert (=> start!41064 (= b_free!10977 (not b_next!10977))))

(declare-fun tp!38761 () Bool)

(declare-fun b_and!19161 () Bool)

(assert (=> start!41064 (= tp!38761 b_and!19161)))

(declare-fun b!457932 () Bool)

(declare-fun res!273522 () Bool)

(declare-fun e!267401 () Bool)

(assert (=> b!457932 (=> (not res!273522) (not e!267401))))

(declare-datatypes ((array!28431 0))(
  ( (array!28432 (arr!13658 (Array (_ BitVec 32) (_ BitVec 64))) (size!14010 (_ BitVec 32))) )
))
(declare-fun lt!207139 () array!28431)

(declare-datatypes ((List!8243 0))(
  ( (Nil!8240) (Cons!8239 (h!9095 (_ BitVec 64)) (t!14099 List!8243)) )
))
(declare-fun arrayNoDuplicates!0 (array!28431 (_ BitVec 32) List!8243) Bool)

(assert (=> b!457932 (= res!273522 (arrayNoDuplicates!0 lt!207139 #b00000000000000000000000000000000 Nil!8240))))

(declare-fun b!457933 () Bool)

(declare-fun e!267399 () Bool)

(declare-fun tp_is_empty!12315 () Bool)

(assert (=> b!457933 (= e!267399 tp_is_empty!12315)))

(declare-fun b!457934 () Bool)

(declare-fun e!267400 () Bool)

(assert (=> b!457934 (= e!267400 e!267401)))

(declare-fun res!273524 () Bool)

(assert (=> b!457934 (=> (not res!273524) (not e!267401))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28431 (_ BitVec 32)) Bool)

(assert (=> b!457934 (= res!273524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207139 mask!1025))))

(declare-fun _keys!709 () array!28431)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457934 (= lt!207139 (array!28432 (store (arr!13658 _keys!709) i!563 k0!794) (size!14010 _keys!709)))))

(declare-fun b!457935 () Bool)

(declare-fun e!267397 () Bool)

(declare-fun mapRes!20116 () Bool)

(assert (=> b!457935 (= e!267397 (and e!267399 mapRes!20116))))

(declare-fun condMapEmpty!20116 () Bool)

(declare-datatypes ((V!17525 0))(
  ( (V!17526 (val!6202 Int)) )
))
(declare-datatypes ((ValueCell!5814 0))(
  ( (ValueCellFull!5814 (v!8472 V!17525)) (EmptyCell!5814) )
))
(declare-datatypes ((array!28433 0))(
  ( (array!28434 (arr!13659 (Array (_ BitVec 32) ValueCell!5814)) (size!14011 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28433)

(declare-fun mapDefault!20116 () ValueCell!5814)

(assert (=> b!457935 (= condMapEmpty!20116 (= (arr!13659 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5814)) mapDefault!20116)))))

(declare-fun mapNonEmpty!20116 () Bool)

(declare-fun tp!38760 () Bool)

(declare-fun e!267402 () Bool)

(assert (=> mapNonEmpty!20116 (= mapRes!20116 (and tp!38760 e!267402))))

(declare-fun mapRest!20116 () (Array (_ BitVec 32) ValueCell!5814))

(declare-fun mapValue!20116 () ValueCell!5814)

(declare-fun mapKey!20116 () (_ BitVec 32))

(assert (=> mapNonEmpty!20116 (= (arr!13659 _values!549) (store mapRest!20116 mapKey!20116 mapValue!20116))))

(declare-fun res!273527 () Bool)

(assert (=> start!41064 (=> (not res!273527) (not e!267400))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!41064 (= res!273527 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14010 _keys!709))))))

(assert (=> start!41064 e!267400))

(assert (=> start!41064 tp_is_empty!12315))

(assert (=> start!41064 tp!38761))

(assert (=> start!41064 true))

(declare-fun array_inv!9888 (array!28433) Bool)

(assert (=> start!41064 (and (array_inv!9888 _values!549) e!267397)))

(declare-fun array_inv!9889 (array!28431) Bool)

(assert (=> start!41064 (array_inv!9889 _keys!709)))

(declare-fun b!457936 () Bool)

(declare-fun res!273523 () Bool)

(assert (=> b!457936 (=> (not res!273523) (not e!267400))))

(assert (=> b!457936 (= res!273523 (or (= (select (arr!13658 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13658 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457937 () Bool)

(declare-fun res!273515 () Bool)

(assert (=> b!457937 (=> (not res!273515) (not e!267400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457937 (= res!273515 (validMask!0 mask!1025))))

(declare-fun b!457938 () Bool)

(declare-fun res!273516 () Bool)

(assert (=> b!457938 (=> (not res!273516) (not e!267400))))

(assert (=> b!457938 (= res!273516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457939 () Bool)

(declare-fun res!273517 () Bool)

(assert (=> b!457939 (=> (not res!273517) (not e!267400))))

(assert (=> b!457939 (= res!273517 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8240))))

(declare-fun b!457940 () Bool)

(declare-fun e!267395 () Bool)

(declare-fun e!267396 () Bool)

(assert (=> b!457940 (= e!267395 (not e!267396))))

(declare-fun res!273519 () Bool)

(assert (=> b!457940 (=> res!273519 e!267396)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457940 (= res!273519 (not (validKeyInArray!0 (select (arr!13658 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8170 0))(
  ( (tuple2!8171 (_1!4096 (_ BitVec 64)) (_2!4096 V!17525)) )
))
(declare-datatypes ((List!8244 0))(
  ( (Nil!8241) (Cons!8240 (h!9096 tuple2!8170) (t!14100 List!8244)) )
))
(declare-datatypes ((ListLongMap!7083 0))(
  ( (ListLongMap!7084 (toList!3557 List!8244)) )
))
(declare-fun lt!207140 () ListLongMap!7083)

(declare-fun lt!207143 () ListLongMap!7083)

(assert (=> b!457940 (= lt!207140 lt!207143)))

(declare-fun lt!207142 () ListLongMap!7083)

(declare-fun v!412 () V!17525)

(declare-fun +!1593 (ListLongMap!7083 tuple2!8170) ListLongMap!7083)

(assert (=> b!457940 (= lt!207143 (+!1593 lt!207142 (tuple2!8171 k0!794 v!412)))))

(declare-fun lt!207141 () array!28433)

(declare-fun minValue!515 () V!17525)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17525)

(declare-fun getCurrentListMapNoExtraKeys!1739 (array!28431 array!28433 (_ BitVec 32) (_ BitVec 32) V!17525 V!17525 (_ BitVec 32) Int) ListLongMap!7083)

(assert (=> b!457940 (= lt!207140 (getCurrentListMapNoExtraKeys!1739 lt!207139 lt!207141 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457940 (= lt!207142 (getCurrentListMapNoExtraKeys!1739 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13306 0))(
  ( (Unit!13307) )
))
(declare-fun lt!207137 () Unit!13306)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!752 (array!28431 array!28433 (_ BitVec 32) (_ BitVec 32) V!17525 V!17525 (_ BitVec 32) (_ BitVec 64) V!17525 (_ BitVec 32) Int) Unit!13306)

(assert (=> b!457940 (= lt!207137 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!752 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457941 () Bool)

(declare-fun res!273518 () Bool)

(assert (=> b!457941 (=> (not res!273518) (not e!267401))))

(assert (=> b!457941 (= res!273518 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!20116 () Bool)

(assert (=> mapIsEmpty!20116 mapRes!20116))

(declare-fun b!457942 () Bool)

(declare-fun res!273526 () Bool)

(assert (=> b!457942 (=> (not res!273526) (not e!267400))))

(declare-fun arrayContainsKey!0 (array!28431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457942 (= res!273526 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457943 () Bool)

(assert (=> b!457943 (= e!267402 tp_is_empty!12315)))

(declare-fun b!457944 () Bool)

(declare-fun res!273525 () Bool)

(assert (=> b!457944 (=> (not res!273525) (not e!267400))))

(assert (=> b!457944 (= res!273525 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14010 _keys!709))))))

(declare-fun b!457945 () Bool)

(declare-fun res!273528 () Bool)

(assert (=> b!457945 (=> (not res!273528) (not e!267400))))

(assert (=> b!457945 (= res!273528 (and (= (size!14011 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14010 _keys!709) (size!14011 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457946 () Bool)

(assert (=> b!457946 (= e!267401 e!267395)))

(declare-fun res!273520 () Bool)

(assert (=> b!457946 (=> (not res!273520) (not e!267395))))

(assert (=> b!457946 (= res!273520 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207138 () ListLongMap!7083)

(assert (=> b!457946 (= lt!207138 (getCurrentListMapNoExtraKeys!1739 lt!207139 lt!207141 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457946 (= lt!207141 (array!28434 (store (arr!13659 _values!549) i!563 (ValueCellFull!5814 v!412)) (size!14011 _values!549)))))

(declare-fun lt!207144 () ListLongMap!7083)

(assert (=> b!457946 (= lt!207144 (getCurrentListMapNoExtraKeys!1739 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457947 () Bool)

(declare-fun res!273521 () Bool)

(assert (=> b!457947 (=> (not res!273521) (not e!267400))))

(assert (=> b!457947 (= res!273521 (validKeyInArray!0 k0!794))))

(declare-fun b!457948 () Bool)

(assert (=> b!457948 (= e!267396 true)))

(declare-fun get!6725 (ValueCell!5814 V!17525) V!17525)

(declare-fun dynLambda!883 (Int (_ BitVec 64)) V!17525)

(assert (=> b!457948 (= lt!207138 (+!1593 lt!207143 (tuple2!8171 (select (arr!13658 _keys!709) from!863) (get!6725 (select (arr!13659 _values!549) from!863) (dynLambda!883 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!41064 res!273527) b!457937))

(assert (= (and b!457937 res!273515) b!457945))

(assert (= (and b!457945 res!273528) b!457938))

(assert (= (and b!457938 res!273516) b!457939))

(assert (= (and b!457939 res!273517) b!457944))

(assert (= (and b!457944 res!273525) b!457947))

(assert (= (and b!457947 res!273521) b!457936))

(assert (= (and b!457936 res!273523) b!457942))

(assert (= (and b!457942 res!273526) b!457934))

(assert (= (and b!457934 res!273524) b!457932))

(assert (= (and b!457932 res!273522) b!457941))

(assert (= (and b!457941 res!273518) b!457946))

(assert (= (and b!457946 res!273520) b!457940))

(assert (= (and b!457940 (not res!273519)) b!457948))

(assert (= (and b!457935 condMapEmpty!20116) mapIsEmpty!20116))

(assert (= (and b!457935 (not condMapEmpty!20116)) mapNonEmpty!20116))

(get-info :version)

(assert (= (and mapNonEmpty!20116 ((_ is ValueCellFull!5814) mapValue!20116)) b!457943))

(assert (= (and b!457935 ((_ is ValueCellFull!5814) mapDefault!20116)) b!457933))

(assert (= start!41064 b!457935))

(declare-fun b_lambda!9743 () Bool)

(assert (=> (not b_lambda!9743) (not b!457948)))

(declare-fun t!14098 () Bool)

(declare-fun tb!3813 () Bool)

(assert (=> (and start!41064 (= defaultEntry!557 defaultEntry!557) t!14098) tb!3813))

(declare-fun result!7167 () Bool)

(assert (=> tb!3813 (= result!7167 tp_is_empty!12315)))

(assert (=> b!457948 t!14098))

(declare-fun b_and!19163 () Bool)

(assert (= b_and!19161 (and (=> t!14098 result!7167) b_and!19163)))

(declare-fun m!441261 () Bool)

(assert (=> start!41064 m!441261))

(declare-fun m!441263 () Bool)

(assert (=> start!41064 m!441263))

(declare-fun m!441265 () Bool)

(assert (=> b!457932 m!441265))

(declare-fun m!441267 () Bool)

(assert (=> b!457934 m!441267))

(declare-fun m!441269 () Bool)

(assert (=> b!457934 m!441269))

(declare-fun m!441271 () Bool)

(assert (=> b!457938 m!441271))

(declare-fun m!441273 () Bool)

(assert (=> b!457947 m!441273))

(declare-fun m!441275 () Bool)

(assert (=> mapNonEmpty!20116 m!441275))

(declare-fun m!441277 () Bool)

(assert (=> b!457939 m!441277))

(declare-fun m!441279 () Bool)

(assert (=> b!457940 m!441279))

(declare-fun m!441281 () Bool)

(assert (=> b!457940 m!441281))

(declare-fun m!441283 () Bool)

(assert (=> b!457940 m!441283))

(declare-fun m!441285 () Bool)

(assert (=> b!457940 m!441285))

(assert (=> b!457940 m!441279))

(declare-fun m!441287 () Bool)

(assert (=> b!457940 m!441287))

(declare-fun m!441289 () Bool)

(assert (=> b!457940 m!441289))

(declare-fun m!441291 () Bool)

(assert (=> b!457946 m!441291))

(declare-fun m!441293 () Bool)

(assert (=> b!457946 m!441293))

(declare-fun m!441295 () Bool)

(assert (=> b!457946 m!441295))

(assert (=> b!457948 m!441279))

(declare-fun m!441297 () Bool)

(assert (=> b!457948 m!441297))

(declare-fun m!441299 () Bool)

(assert (=> b!457948 m!441299))

(declare-fun m!441301 () Bool)

(assert (=> b!457948 m!441301))

(assert (=> b!457948 m!441301))

(assert (=> b!457948 m!441299))

(declare-fun m!441303 () Bool)

(assert (=> b!457948 m!441303))

(declare-fun m!441305 () Bool)

(assert (=> b!457936 m!441305))

(declare-fun m!441307 () Bool)

(assert (=> b!457937 m!441307))

(declare-fun m!441309 () Bool)

(assert (=> b!457942 m!441309))

(check-sat (not b!457938) b_and!19163 (not b!457942) (not b!457937) (not b!457934) (not b!457948) (not start!41064) tp_is_empty!12315 (not b!457940) (not b!457946) (not b_next!10977) (not b_lambda!9743) (not b!457932) (not b!457947) (not b!457939) (not mapNonEmpty!20116))
(check-sat b_and!19163 (not b_next!10977))
