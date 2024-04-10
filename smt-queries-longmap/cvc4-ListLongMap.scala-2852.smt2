; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41146 () Bool)

(assert start!41146)

(declare-fun b_free!11015 () Bool)

(declare-fun b_next!11015 () Bool)

(assert (=> start!41146 (= b_free!11015 (not b_next!11015))))

(declare-fun tp!38880 () Bool)

(declare-fun b_and!19269 () Bool)

(assert (=> start!41146 (= tp!38880 b_and!19269)))

(declare-fun b!459283 () Bool)

(declare-fun res!274457 () Bool)

(declare-fun e!268084 () Bool)

(assert (=> b!459283 (=> (not res!274457) (not e!268084))))

(declare-datatypes ((array!28507 0))(
  ( (array!28508 (arr!13694 (Array (_ BitVec 32) (_ BitVec 64))) (size!14046 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28507)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17575 0))(
  ( (V!17576 (val!6221 Int)) )
))
(declare-datatypes ((ValueCell!5833 0))(
  ( (ValueCellFull!5833 (v!8499 V!17575)) (EmptyCell!5833) )
))
(declare-datatypes ((array!28509 0))(
  ( (array!28510 (arr!13695 (Array (_ BitVec 32) ValueCell!5833)) (size!14047 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28509)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!459283 (= res!274457 (and (= (size!14047 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14046 _keys!709) (size!14047 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun b!459284 () Bool)

(declare-fun e!268078 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!459284 (= e!268078 (not (= (select (arr!13694 _keys!709) from!863) k!794)))))

(declare-datatypes ((Unit!13345 0))(
  ( (Unit!13346) )
))
(declare-fun lt!207784 () Unit!13345)

(declare-fun e!268079 () Unit!13345)

(assert (=> b!459284 (= lt!207784 e!268079)))

(declare-fun c!56471 () Bool)

(assert (=> b!459284 (= c!56471 (= (select (arr!13694 _keys!709) from!863) k!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8204 0))(
  ( (tuple2!8205 (_1!4113 (_ BitVec 64)) (_2!4113 V!17575)) )
))
(declare-datatypes ((List!8274 0))(
  ( (Nil!8271) (Cons!8270 (h!9126 tuple2!8204) (t!14168 List!8274)) )
))
(declare-datatypes ((ListLongMap!7117 0))(
  ( (ListLongMap!7118 (toList!3574 List!8274)) )
))
(declare-fun lt!207788 () ListLongMap!7117)

(declare-fun lt!207791 () ListLongMap!7117)

(declare-fun +!1610 (ListLongMap!7117 tuple2!8204) ListLongMap!7117)

(declare-fun get!6755 (ValueCell!5833 V!17575) V!17575)

(declare-fun dynLambda!897 (Int (_ BitVec 64)) V!17575)

(assert (=> b!459284 (= lt!207791 (+!1610 lt!207788 (tuple2!8205 (select (arr!13694 _keys!709) from!863) (get!6755 (select (arr!13695 _values!549) from!863) (dynLambda!897 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!20179 () Bool)

(declare-fun mapRes!20179 () Bool)

(declare-fun tp!38881 () Bool)

(declare-fun e!268083 () Bool)

(assert (=> mapNonEmpty!20179 (= mapRes!20179 (and tp!38881 e!268083))))

(declare-fun mapRest!20179 () (Array (_ BitVec 32) ValueCell!5833))

(declare-fun mapKey!20179 () (_ BitVec 32))

(declare-fun mapValue!20179 () ValueCell!5833)

(assert (=> mapNonEmpty!20179 (= (arr!13695 _values!549) (store mapRest!20179 mapKey!20179 mapValue!20179))))

(declare-fun b!459285 () Bool)

(declare-fun res!274461 () Bool)

(declare-fun e!268080 () Bool)

(assert (=> b!459285 (=> (not res!274461) (not e!268080))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459285 (= res!274461 (bvsle from!863 i!563))))

(declare-fun b!459286 () Bool)

(declare-fun Unit!13347 () Unit!13345)

(assert (=> b!459286 (= e!268079 Unit!13347)))

(declare-fun b!459287 () Bool)

(assert (=> b!459287 (= e!268084 e!268080)))

(declare-fun res!274465 () Bool)

(assert (=> b!459287 (=> (not res!274465) (not e!268080))))

(declare-fun lt!207782 () array!28507)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28507 (_ BitVec 32)) Bool)

(assert (=> b!459287 (= res!274465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207782 mask!1025))))

(assert (=> b!459287 (= lt!207782 (array!28508 (store (arr!13694 _keys!709) i!563 k!794) (size!14046 _keys!709)))))

(declare-fun mapIsEmpty!20179 () Bool)

(assert (=> mapIsEmpty!20179 mapRes!20179))

(declare-fun b!459288 () Bool)

(declare-fun res!274455 () Bool)

(assert (=> b!459288 (=> (not res!274455) (not e!268084))))

(assert (=> b!459288 (= res!274455 (or (= (select (arr!13694 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13694 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459289 () Bool)

(declare-fun res!274456 () Bool)

(assert (=> b!459289 (=> (not res!274456) (not e!268084))))

(assert (=> b!459289 (= res!274456 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14046 _keys!709))))))

(declare-fun b!459290 () Bool)

(declare-fun res!274459 () Bool)

(assert (=> b!459290 (=> (not res!274459) (not e!268080))))

(declare-datatypes ((List!8275 0))(
  ( (Nil!8272) (Cons!8271 (h!9127 (_ BitVec 64)) (t!14169 List!8275)) )
))
(declare-fun arrayNoDuplicates!0 (array!28507 (_ BitVec 32) List!8275) Bool)

(assert (=> b!459290 (= res!274459 (arrayNoDuplicates!0 lt!207782 #b00000000000000000000000000000000 Nil!8272))))

(declare-fun b!459291 () Bool)

(declare-fun e!268082 () Bool)

(declare-fun tp_is_empty!12353 () Bool)

(assert (=> b!459291 (= e!268082 tp_is_empty!12353)))

(declare-fun b!459292 () Bool)

(declare-fun e!268085 () Bool)

(assert (=> b!459292 (= e!268085 (and e!268082 mapRes!20179))))

(declare-fun condMapEmpty!20179 () Bool)

(declare-fun mapDefault!20179 () ValueCell!5833)

