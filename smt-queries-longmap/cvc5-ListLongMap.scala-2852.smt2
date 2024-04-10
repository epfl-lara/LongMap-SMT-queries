; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41142 () Bool)

(assert start!41142)

(declare-fun b_free!11011 () Bool)

(declare-fun b_next!11011 () Bool)

(assert (=> start!41142 (= b_free!11011 (not b_next!11011))))

(declare-fun tp!38869 () Bool)

(declare-fun b_and!19261 () Bool)

(assert (=> start!41142 (= tp!38869 b_and!19261)))

(declare-fun b!459165 () Bool)

(declare-fun res!274384 () Bool)

(declare-fun e!268030 () Bool)

(assert (=> b!459165 (=> (not res!274384) (not e!268030))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28499 0))(
  ( (array!28500 (arr!13690 (Array (_ BitVec 32) (_ BitVec 64))) (size!14042 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28499)

(assert (=> b!459165 (= res!274384 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14042 _keys!709))))))

(declare-fun b!459166 () Bool)

(declare-fun res!274372 () Bool)

(assert (=> b!459166 (=> (not res!274372) (not e!268030))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28499 (_ BitVec 32)) Bool)

(assert (=> b!459166 (= res!274372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!20173 () Bool)

(declare-fun mapRes!20173 () Bool)

(declare-fun tp!38868 () Bool)

(declare-fun e!268029 () Bool)

(assert (=> mapNonEmpty!20173 (= mapRes!20173 (and tp!38868 e!268029))))

(declare-datatypes ((V!17571 0))(
  ( (V!17572 (val!6219 Int)) )
))
(declare-datatypes ((ValueCell!5831 0))(
  ( (ValueCellFull!5831 (v!8497 V!17571)) (EmptyCell!5831) )
))
(declare-datatypes ((array!28501 0))(
  ( (array!28502 (arr!13691 (Array (_ BitVec 32) ValueCell!5831)) (size!14043 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28501)

(declare-fun mapValue!20173 () ValueCell!5831)

(declare-fun mapKey!20173 () (_ BitVec 32))

(declare-fun mapRest!20173 () (Array (_ BitVec 32) ValueCell!5831))

(assert (=> mapNonEmpty!20173 (= (arr!13691 _values!549) (store mapRest!20173 mapKey!20173 mapValue!20173))))

(declare-fun b!459167 () Bool)

(declare-fun res!274373 () Bool)

(assert (=> b!459167 (=> (not res!274373) (not e!268030))))

(assert (=> b!459167 (= res!274373 (or (= (select (arr!13690 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13690 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459168 () Bool)

(declare-datatypes ((Unit!13338 0))(
  ( (Unit!13339) )
))
(declare-fun e!268032 () Unit!13338)

(declare-fun Unit!13340 () Unit!13338)

(assert (=> b!459168 (= e!268032 Unit!13340)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!207728 () Unit!13338)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28499 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13338)

(assert (=> b!459168 (= lt!207728 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459168 false))

(declare-fun b!459169 () Bool)

(declare-fun res!274377 () Bool)

(declare-fun e!268027 () Bool)

(assert (=> b!459169 (=> (not res!274377) (not e!268027))))

(declare-fun lt!207731 () array!28499)

(declare-datatypes ((List!8270 0))(
  ( (Nil!8267) (Cons!8266 (h!9122 (_ BitVec 64)) (t!14160 List!8270)) )
))
(declare-fun arrayNoDuplicates!0 (array!28499 (_ BitVec 32) List!8270) Bool)

(assert (=> b!459169 (= res!274377 (arrayNoDuplicates!0 lt!207731 #b00000000000000000000000000000000 Nil!8267))))

(declare-fun b!459170 () Bool)

(declare-fun e!268025 () Bool)

(declare-fun e!268026 () Bool)

(assert (=> b!459170 (= e!268025 (not e!268026))))

(declare-fun res!274382 () Bool)

(assert (=> b!459170 (=> res!274382 e!268026)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459170 (= res!274382 (not (validKeyInArray!0 (select (arr!13690 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8200 0))(
  ( (tuple2!8201 (_1!4111 (_ BitVec 64)) (_2!4111 V!17571)) )
))
(declare-datatypes ((List!8271 0))(
  ( (Nil!8268) (Cons!8267 (h!9123 tuple2!8200) (t!14161 List!8271)) )
))
(declare-datatypes ((ListLongMap!7113 0))(
  ( (ListLongMap!7114 (toList!3572 List!8271)) )
))
(declare-fun lt!207723 () ListLongMap!7113)

(declare-fun lt!207730 () ListLongMap!7113)

(assert (=> b!459170 (= lt!207723 lt!207730)))

(declare-fun lt!207726 () ListLongMap!7113)

(declare-fun v!412 () V!17571)

(declare-fun +!1608 (ListLongMap!7113 tuple2!8200) ListLongMap!7113)

(assert (=> b!459170 (= lt!207730 (+!1608 lt!207726 (tuple2!8201 k!794 v!412)))))

(declare-fun minValue!515 () V!17571)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!207725 () array!28501)

(declare-fun zeroValue!515 () V!17571)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1753 (array!28499 array!28501 (_ BitVec 32) (_ BitVec 32) V!17571 V!17571 (_ BitVec 32) Int) ListLongMap!7113)

(assert (=> b!459170 (= lt!207723 (getCurrentListMapNoExtraKeys!1753 lt!207731 lt!207725 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459170 (= lt!207726 (getCurrentListMapNoExtraKeys!1753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207729 () Unit!13338)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!765 (array!28499 array!28501 (_ BitVec 32) (_ BitVec 32) V!17571 V!17571 (_ BitVec 32) (_ BitVec 64) V!17571 (_ BitVec 32) Int) Unit!13338)

(assert (=> b!459170 (= lt!207729 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!765 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459172 () Bool)

(declare-fun res!274374 () Bool)

(assert (=> b!459172 (=> (not res!274374) (not e!268030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459172 (= res!274374 (validMask!0 mask!1025))))

(declare-fun b!459173 () Bool)

(declare-fun res!274375 () Bool)

(assert (=> b!459173 (=> (not res!274375) (not e!268030))))

(assert (=> b!459173 (= res!274375 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8267))))

(declare-fun b!459174 () Bool)

(declare-fun tp_is_empty!12349 () Bool)

(assert (=> b!459174 (= e!268029 tp_is_empty!12349)))

(declare-fun mapIsEmpty!20173 () Bool)

(assert (=> mapIsEmpty!20173 mapRes!20173))

(declare-fun b!459175 () Bool)

(declare-fun res!274376 () Bool)

(assert (=> b!459175 (=> (not res!274376) (not e!268030))))

(assert (=> b!459175 (= res!274376 (validKeyInArray!0 k!794))))

(declare-fun b!459176 () Bool)

(assert (=> b!459176 (= e!268026 (not (= (select (arr!13690 _keys!709) from!863) k!794)))))

(declare-fun lt!207727 () Unit!13338)

(assert (=> b!459176 (= lt!207727 e!268032)))

(declare-fun c!56465 () Bool)

(assert (=> b!459176 (= c!56465 (= (select (arr!13690 _keys!709) from!863) k!794))))

(declare-fun lt!207724 () ListLongMap!7113)

(declare-fun get!6753 (ValueCell!5831 V!17571) V!17571)

(declare-fun dynLambda!895 (Int (_ BitVec 64)) V!17571)

(assert (=> b!459176 (= lt!207724 (+!1608 lt!207730 (tuple2!8201 (select (arr!13690 _keys!709) from!863) (get!6753 (select (arr!13691 _values!549) from!863) (dynLambda!895 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459177 () Bool)

(assert (=> b!459177 (= e!268030 e!268027)))

(declare-fun res!274378 () Bool)

(assert (=> b!459177 (=> (not res!274378) (not e!268027))))

(assert (=> b!459177 (= res!274378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207731 mask!1025))))

(assert (=> b!459177 (= lt!207731 (array!28500 (store (arr!13690 _keys!709) i!563 k!794) (size!14042 _keys!709)))))

(declare-fun b!459178 () Bool)

(declare-fun res!274383 () Bool)

(assert (=> b!459178 (=> (not res!274383) (not e!268030))))

(assert (=> b!459178 (= res!274383 (and (= (size!14043 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14042 _keys!709) (size!14043 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459179 () Bool)

(declare-fun e!268028 () Bool)

(declare-fun e!268031 () Bool)

(assert (=> b!459179 (= e!268028 (and e!268031 mapRes!20173))))

(declare-fun condMapEmpty!20173 () Bool)

(declare-fun mapDefault!20173 () ValueCell!5831)

