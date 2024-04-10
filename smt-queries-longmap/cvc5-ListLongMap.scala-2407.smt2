; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38082 () Bool)

(assert start!38082)

(declare-fun b_free!9007 () Bool)

(declare-fun b_next!9007 () Bool)

(assert (=> start!38082 (= b_free!9007 (not b_next!9007))))

(declare-fun tp!31797 () Bool)

(declare-fun b_and!16345 () Bool)

(assert (=> start!38082 (= tp!31797 b_and!16345)))

(declare-datatypes ((V!14011 0))(
  ( (V!14012 (val!4884 Int)) )
))
(declare-datatypes ((tuple2!6586 0))(
  ( (tuple2!6587 (_1!3304 (_ BitVec 64)) (_2!3304 V!14011)) )
))
(declare-fun lt!185312 () tuple2!6586)

(declare-fun b!392250 () Bool)

(declare-datatypes ((List!6439 0))(
  ( (Nil!6436) (Cons!6435 (h!7291 tuple2!6586) (t!11605 List!6439)) )
))
(declare-datatypes ((ListLongMap!5499 0))(
  ( (ListLongMap!5500 (toList!2765 List!6439)) )
))
(declare-fun lt!185315 () ListLongMap!5499)

(declare-fun e!237540 () Bool)

(declare-fun lt!185319 () ListLongMap!5499)

(declare-fun +!1060 (ListLongMap!5499 tuple2!6586) ListLongMap!5499)

(assert (=> b!392250 (= e!237540 (= lt!185319 (+!1060 lt!185315 lt!185312)))))

(declare-fun e!237538 () Bool)

(assert (=> b!392250 e!237538))

(declare-fun res!224622 () Bool)

(assert (=> b!392250 (=> (not res!224622) (not e!237538))))

(declare-fun lt!185311 () ListLongMap!5499)

(declare-fun lt!185318 () ListLongMap!5499)

(assert (=> b!392250 (= res!224622 (= lt!185311 (+!1060 lt!185318 lt!185312)))))

(declare-fun minValue!472 () V!14011)

(assert (=> b!392250 (= lt!185312 (tuple2!6587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392251 () Bool)

(declare-fun res!224629 () Bool)

(declare-fun e!237541 () Bool)

(assert (=> b!392251 (=> (not res!224629) (not e!237541))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4496 0))(
  ( (ValueCellFull!4496 (v!7113 V!14011)) (EmptyCell!4496) )
))
(declare-datatypes ((array!23263 0))(
  ( (array!23264 (arr!11092 (Array (_ BitVec 32) ValueCell!4496)) (size!11444 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23263)

(declare-datatypes ((array!23265 0))(
  ( (array!23266 (arr!11093 (Array (_ BitVec 32) (_ BitVec 64))) (size!11445 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23265)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!392251 (= res!224629 (and (= (size!11444 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11445 _keys!658) (size!11444 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392252 () Bool)

(declare-fun res!224628 () Bool)

(assert (=> b!392252 (=> (not res!224628) (not e!237541))))

(declare-datatypes ((List!6440 0))(
  ( (Nil!6437) (Cons!6436 (h!7292 (_ BitVec 64)) (t!11606 List!6440)) )
))
(declare-fun arrayNoDuplicates!0 (array!23265 (_ BitVec 32) List!6440) Bool)

(assert (=> b!392252 (= res!224628 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6437))))

(declare-fun b!392253 () Bool)

(declare-fun res!224620 () Bool)

(assert (=> b!392253 (=> (not res!224620) (not e!237541))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392253 (= res!224620 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!392254 () Bool)

(declare-fun res!224624 () Bool)

(assert (=> b!392254 (=> (not res!224624) (not e!237541))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!392254 (= res!224624 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11445 _keys!658))))))

(declare-fun b!392255 () Bool)

(declare-fun res!224626 () Bool)

(assert (=> b!392255 (=> (not res!224626) (not e!237541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23265 (_ BitVec 32)) Bool)

(assert (=> b!392255 (= res!224626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392256 () Bool)

(declare-fun e!237535 () Bool)

(assert (=> b!392256 (= e!237541 e!237535)))

(declare-fun res!224623 () Bool)

(assert (=> b!392256 (=> (not res!224623) (not e!237535))))

(declare-fun lt!185314 () array!23265)

(assert (=> b!392256 (= res!224623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185314 mask!970))))

(assert (=> b!392256 (= lt!185314 (array!23266 (store (arr!11093 _keys!658) i!548 k!778) (size!11445 _keys!658)))))

(declare-fun b!392257 () Bool)

(assert (=> b!392257 (= e!237535 (not e!237540))))

(declare-fun res!224625 () Bool)

(assert (=> b!392257 (=> res!224625 e!237540)))

(assert (=> b!392257 (= res!224625 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14011)

(declare-fun getCurrentListMap!2107 (array!23265 array!23263 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) Int) ListLongMap!5499)

(assert (=> b!392257 (= lt!185319 (getCurrentListMap!2107 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185313 () array!23263)

(assert (=> b!392257 (= lt!185311 (getCurrentListMap!2107 lt!185314 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185316 () ListLongMap!5499)

(assert (=> b!392257 (and (= lt!185318 lt!185316) (= lt!185316 lt!185318))))

(declare-fun v!373 () V!14011)

(assert (=> b!392257 (= lt!185316 (+!1060 lt!185315 (tuple2!6587 k!778 v!373)))))

(declare-datatypes ((Unit!12004 0))(
  ( (Unit!12005) )
))
(declare-fun lt!185317 () Unit!12004)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!271 (array!23265 array!23263 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) (_ BitVec 64) V!14011 (_ BitVec 32) Int) Unit!12004)

(assert (=> b!392257 (= lt!185317 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!271 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!987 (array!23265 array!23263 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) Int) ListLongMap!5499)

(assert (=> b!392257 (= lt!185318 (getCurrentListMapNoExtraKeys!987 lt!185314 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392257 (= lt!185313 (array!23264 (store (arr!11092 _values!506) i!548 (ValueCellFull!4496 v!373)) (size!11444 _values!506)))))

(assert (=> b!392257 (= lt!185315 (getCurrentListMapNoExtraKeys!987 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392258 () Bool)

(declare-fun e!237537 () Bool)

(declare-fun tp_is_empty!9679 () Bool)

(assert (=> b!392258 (= e!237537 tp_is_empty!9679)))

(declare-fun b!392259 () Bool)

(assert (=> b!392259 (= e!237538 (= lt!185311 (+!1060 lt!185316 lt!185312)))))

(declare-fun mapNonEmpty!16107 () Bool)

(declare-fun mapRes!16107 () Bool)

(declare-fun tp!31796 () Bool)

(declare-fun e!237536 () Bool)

(assert (=> mapNonEmpty!16107 (= mapRes!16107 (and tp!31796 e!237536))))

(declare-fun mapValue!16107 () ValueCell!4496)

(declare-fun mapRest!16107 () (Array (_ BitVec 32) ValueCell!4496))

(declare-fun mapKey!16107 () (_ BitVec 32))

(assert (=> mapNonEmpty!16107 (= (arr!11092 _values!506) (store mapRest!16107 mapKey!16107 mapValue!16107))))

(declare-fun b!392260 () Bool)

(assert (=> b!392260 (= e!237536 tp_is_empty!9679)))

(declare-fun b!392261 () Bool)

(declare-fun e!237534 () Bool)

(assert (=> b!392261 (= e!237534 (and e!237537 mapRes!16107))))

(declare-fun condMapEmpty!16107 () Bool)

(declare-fun mapDefault!16107 () ValueCell!4496)

