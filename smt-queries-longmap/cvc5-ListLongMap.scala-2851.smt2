; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41136 () Bool)

(assert start!41136)

(declare-fun b_free!11005 () Bool)

(declare-fun b_next!11005 () Bool)

(assert (=> start!41136 (= b_free!11005 (not b_next!11005))))

(declare-fun tp!38851 () Bool)

(declare-fun b_and!19249 () Bool)

(assert (=> start!41136 (= tp!38851 b_and!19249)))

(declare-fun b!458988 () Bool)

(declare-fun e!267949 () Bool)

(declare-fun tp_is_empty!12343 () Bool)

(assert (=> b!458988 (= e!267949 tp_is_empty!12343)))

(declare-fun b!458989 () Bool)

(declare-fun e!267951 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28487 0))(
  ( (array!28488 (arr!13684 (Array (_ BitVec 32) (_ BitVec 64))) (size!14036 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28487)

(assert (=> b!458989 (= e!267951 (bvslt from!863 (size!14036 _keys!709)))))

(declare-datatypes ((Unit!13330 0))(
  ( (Unit!13331) )
))
(declare-fun lt!207639 () Unit!13330)

(declare-fun e!267948 () Unit!13330)

(assert (=> b!458989 (= lt!207639 e!267948)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun c!56456 () Bool)

(assert (=> b!458989 (= c!56456 (= (select (arr!13684 _keys!709) from!863) k!794))))

(declare-datatypes ((V!17563 0))(
  ( (V!17564 (val!6216 Int)) )
))
(declare-datatypes ((ValueCell!5828 0))(
  ( (ValueCellFull!5828 (v!8494 V!17563)) (EmptyCell!5828) )
))
(declare-datatypes ((array!28489 0))(
  ( (array!28490 (arr!13685 (Array (_ BitVec 32) ValueCell!5828)) (size!14037 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28489)

(declare-datatypes ((tuple2!8194 0))(
  ( (tuple2!8195 (_1!4108 (_ BitVec 64)) (_2!4108 V!17563)) )
))
(declare-datatypes ((List!8265 0))(
  ( (Nil!8262) (Cons!8261 (h!9117 tuple2!8194) (t!14149 List!8265)) )
))
(declare-datatypes ((ListLongMap!7107 0))(
  ( (ListLongMap!7108 (toList!3569 List!8265)) )
))
(declare-fun lt!207636 () ListLongMap!7107)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!207640 () ListLongMap!7107)

(declare-fun +!1605 (ListLongMap!7107 tuple2!8194) ListLongMap!7107)

(declare-fun get!6748 (ValueCell!5828 V!17563) V!17563)

(declare-fun dynLambda!892 (Int (_ BitVec 64)) V!17563)

(assert (=> b!458989 (= lt!207636 (+!1605 lt!207640 (tuple2!8195 (select (arr!13684 _keys!709) from!863) (get!6748 (select (arr!13685 _values!549) from!863) (dynLambda!892 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458990 () Bool)

(declare-fun res!274246 () Bool)

(declare-fun e!267950 () Bool)

(assert (=> b!458990 (=> (not res!274246) (not e!267950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458990 (= res!274246 (validKeyInArray!0 k!794))))

(declare-fun b!458991 () Bool)

(declare-fun res!274249 () Bool)

(assert (=> b!458991 (=> (not res!274249) (not e!267950))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458991 (= res!274249 (or (= (select (arr!13684 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13684 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458992 () Bool)

(declare-fun res!274254 () Bool)

(declare-fun e!267943 () Bool)

(assert (=> b!458992 (=> (not res!274254) (not e!267943))))

(assert (=> b!458992 (= res!274254 (bvsle from!863 i!563))))

(declare-fun b!458993 () Bool)

(declare-fun res!274256 () Bool)

(assert (=> b!458993 (=> (not res!274256) (not e!267950))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28487 (_ BitVec 32)) Bool)

(assert (=> b!458993 (= res!274256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458995 () Bool)

(declare-fun res!274257 () Bool)

(assert (=> b!458995 (=> (not res!274257) (not e!267943))))

(declare-fun lt!207635 () array!28487)

(declare-datatypes ((List!8266 0))(
  ( (Nil!8263) (Cons!8262 (h!9118 (_ BitVec 64)) (t!14150 List!8266)) )
))
(declare-fun arrayNoDuplicates!0 (array!28487 (_ BitVec 32) List!8266) Bool)

(assert (=> b!458995 (= res!274257 (arrayNoDuplicates!0 lt!207635 #b00000000000000000000000000000000 Nil!8263))))

(declare-fun b!458996 () Bool)

(declare-fun e!267945 () Bool)

(declare-fun mapRes!20164 () Bool)

(assert (=> b!458996 (= e!267945 (and e!267949 mapRes!20164))))

(declare-fun condMapEmpty!20164 () Bool)

(declare-fun mapDefault!20164 () ValueCell!5828)

