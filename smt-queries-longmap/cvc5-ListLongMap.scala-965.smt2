; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20926 () Bool)

(assert start!20926)

(declare-fun b_free!5539 () Bool)

(declare-fun b_next!5539 () Bool)

(assert (=> start!20926 (= b_free!5539 (not b_next!5539))))

(declare-fun tp!19663 () Bool)

(declare-fun b_and!12309 () Bool)

(assert (=> start!20926 (= tp!19663 b_and!12309)))

(declare-fun b!210172 () Bool)

(declare-fun e!136882 () Bool)

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!210172 (= e!136882 (not (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!136884 () Bool)

(assert (=> b!210172 e!136884))

(declare-fun res!102527 () Bool)

(assert (=> b!210172 (=> (not res!102527) (not e!136884))))

(declare-datatypes ((V!6849 0))(
  ( (V!6850 (val!2745 Int)) )
))
(declare-datatypes ((tuple2!4150 0))(
  ( (tuple2!4151 (_1!2086 (_ BitVec 64)) (_2!2086 V!6849)) )
))
(declare-datatypes ((List!3044 0))(
  ( (Nil!3041) (Cons!3040 (h!3682 tuple2!4150) (t!7979 List!3044)) )
))
(declare-datatypes ((ListLongMap!3063 0))(
  ( (ListLongMap!3064 (toList!1547 List!3044)) )
))
(declare-fun lt!107580 () ListLongMap!3063)

(declare-fun lt!107576 () tuple2!4150)

(declare-fun lt!107575 () tuple2!4150)

(declare-fun lt!107578 () ListLongMap!3063)

(declare-fun +!550 (ListLongMap!3063 tuple2!4150) ListLongMap!3063)

(assert (=> b!210172 (= res!102527 (= lt!107578 (+!550 (+!550 lt!107580 lt!107576) lt!107575)))))

(declare-fun minValue!615 () V!6849)

(assert (=> b!210172 (= lt!107575 (tuple2!4151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun zeroValue!615 () V!6849)

(assert (=> b!210172 (= lt!107576 (tuple2!4151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!102528 () Bool)

(declare-fun e!136881 () Bool)

(assert (=> start!20926 (=> (not res!102528) (not e!136881))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20926 (= res!102528 (validMask!0 mask!1149))))

(assert (=> start!20926 e!136881))

(declare-datatypes ((ValueCell!2357 0))(
  ( (ValueCellFull!2357 (v!4723 V!6849)) (EmptyCell!2357) )
))
(declare-datatypes ((array!10001 0))(
  ( (array!10002 (arr!4749 (Array (_ BitVec 32) ValueCell!2357)) (size!5074 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10001)

(declare-fun e!136883 () Bool)

(declare-fun array_inv!3143 (array!10001) Bool)

(assert (=> start!20926 (and (array_inv!3143 _values!649) e!136883)))

(assert (=> start!20926 true))

(declare-fun tp_is_empty!5401 () Bool)

(assert (=> start!20926 tp_is_empty!5401))

(declare-datatypes ((array!10003 0))(
  ( (array!10004 (arr!4750 (Array (_ BitVec 32) (_ BitVec 64))) (size!5075 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10003)

(declare-fun array_inv!3144 (array!10003) Bool)

(assert (=> start!20926 (array_inv!3144 _keys!825)))

(assert (=> start!20926 tp!19663))

(declare-fun b!210173 () Bool)

(declare-fun res!102524 () Bool)

(assert (=> b!210173 (=> (not res!102524) (not e!136881))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210173 (= res!102524 (and (= (size!5074 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5075 _keys!825) (size!5074 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210174 () Bool)

(declare-fun res!102521 () Bool)

(assert (=> b!210174 (=> (not res!102521) (not e!136881))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210174 (= res!102521 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5075 _keys!825))))))

(declare-fun b!210175 () Bool)

(declare-fun e!136880 () Bool)

(assert (=> b!210175 (= e!136880 tp_is_empty!5401)))

(declare-fun b!210176 () Bool)

(declare-fun e!136879 () Bool)

(assert (=> b!210176 (= e!136879 tp_is_empty!5401)))

(declare-fun mapNonEmpty!9176 () Bool)

(declare-fun mapRes!9176 () Bool)

(declare-fun tp!19664 () Bool)

(assert (=> mapNonEmpty!9176 (= mapRes!9176 (and tp!19664 e!136880))))

(declare-fun mapKey!9176 () (_ BitVec 32))

(declare-fun mapRest!9176 () (Array (_ BitVec 32) ValueCell!2357))

(declare-fun mapValue!9176 () ValueCell!2357)

(assert (=> mapNonEmpty!9176 (= (arr!4749 _values!649) (store mapRest!9176 mapKey!9176 mapValue!9176))))

(declare-fun b!210177 () Bool)

(assert (=> b!210177 (= e!136883 (and e!136879 mapRes!9176))))

(declare-fun condMapEmpty!9176 () Bool)

(declare-fun mapDefault!9176 () ValueCell!2357)

