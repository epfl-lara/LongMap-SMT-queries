; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20782 () Bool)

(assert start!20782)

(declare-fun b_free!5435 () Bool)

(declare-fun b_next!5435 () Bool)

(assert (=> start!20782 (= b_free!5435 (not b_next!5435))))

(declare-fun tp!19346 () Bool)

(declare-fun b_and!12181 () Bool)

(assert (=> start!20782 (= tp!19346 b_and!12181)))

(declare-fun b!208190 () Bool)

(declare-fun res!101221 () Bool)

(declare-fun e!135824 () Bool)

(assert (=> b!208190 (=> (not res!101221) (not e!135824))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9799 0))(
  ( (array!9800 (arr!4650 (Array (_ BitVec 32) (_ BitVec 64))) (size!4975 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9799)

(assert (=> b!208190 (= res!101221 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4975 _keys!825))))))

(declare-fun mapIsEmpty!9014 () Bool)

(declare-fun mapRes!9014 () Bool)

(assert (=> mapIsEmpty!9014 mapRes!9014))

(declare-fun b!208191 () Bool)

(declare-datatypes ((V!6709 0))(
  ( (V!6710 (val!2693 Int)) )
))
(declare-datatypes ((ValueCell!2305 0))(
  ( (ValueCellFull!2305 (v!4663 V!6709)) (EmptyCell!2305) )
))
(declare-datatypes ((array!9801 0))(
  ( (array!9802 (arr!4651 (Array (_ BitVec 32) ValueCell!2305)) (size!4976 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9801)

(assert (=> b!208191 (= e!135824 (bvsge i!601 (size!4976 _values!649)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6709)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6709)

(declare-datatypes ((tuple2!4082 0))(
  ( (tuple2!4083 (_1!2052 (_ BitVec 64)) (_2!2052 V!6709)) )
))
(declare-datatypes ((List!2977 0))(
  ( (Nil!2974) (Cons!2973 (h!3615 tuple2!4082) (t!7908 List!2977)) )
))
(declare-datatypes ((ListLongMap!2995 0))(
  ( (ListLongMap!2996 (toList!1513 List!2977)) )
))
(declare-fun lt!106737 () ListLongMap!2995)

(declare-fun getCurrentListMapNoExtraKeys!454 (array!9799 array!9801 (_ BitVec 32) (_ BitVec 32) V!6709 V!6709 (_ BitVec 32) Int) ListLongMap!2995)

(assert (=> b!208191 (= lt!106737 (getCurrentListMapNoExtraKeys!454 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9014 () Bool)

(declare-fun tp!19345 () Bool)

(declare-fun e!135822 () Bool)

(assert (=> mapNonEmpty!9014 (= mapRes!9014 (and tp!19345 e!135822))))

(declare-fun mapKey!9014 () (_ BitVec 32))

(declare-fun mapRest!9014 () (Array (_ BitVec 32) ValueCell!2305))

(declare-fun mapValue!9014 () ValueCell!2305)

(assert (=> mapNonEmpty!9014 (= (arr!4651 _values!649) (store mapRest!9014 mapKey!9014 mapValue!9014))))

(declare-fun b!208192 () Bool)

(declare-fun res!101224 () Bool)

(assert (=> b!208192 (=> (not res!101224) (not e!135824))))

(assert (=> b!208192 (= res!101224 (and (= (size!4976 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4975 _keys!825) (size!4976 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208193 () Bool)

(declare-fun res!101222 () Bool)

(assert (=> b!208193 (=> (not res!101222) (not e!135824))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!208193 (= res!101222 (= (select (arr!4650 _keys!825) i!601) k!843))))

(declare-fun b!208194 () Bool)

(declare-fun res!101227 () Bool)

(assert (=> b!208194 (=> (not res!101227) (not e!135824))))

(declare-datatypes ((List!2978 0))(
  ( (Nil!2975) (Cons!2974 (h!3616 (_ BitVec 64)) (t!7909 List!2978)) )
))
(declare-fun arrayNoDuplicates!0 (array!9799 (_ BitVec 32) List!2978) Bool)

(assert (=> b!208194 (= res!101227 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2975))))

(declare-fun b!208195 () Bool)

(declare-fun tp_is_empty!5297 () Bool)

(assert (=> b!208195 (= e!135822 tp_is_empty!5297)))

(declare-fun b!208197 () Bool)

(declare-fun e!135821 () Bool)

(assert (=> b!208197 (= e!135821 tp_is_empty!5297)))

(declare-fun b!208198 () Bool)

(declare-fun res!101225 () Bool)

(assert (=> b!208198 (=> (not res!101225) (not e!135824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9799 (_ BitVec 32)) Bool)

(assert (=> b!208198 (= res!101225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208199 () Bool)

(declare-fun e!135823 () Bool)

(assert (=> b!208199 (= e!135823 (and e!135821 mapRes!9014))))

(declare-fun condMapEmpty!9014 () Bool)

(declare-fun mapDefault!9014 () ValueCell!2305)

