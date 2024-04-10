; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20984 () Bool)

(assert start!20984)

(declare-fun b_free!5555 () Bool)

(declare-fun b_next!5555 () Bool)

(assert (=> start!20984 (= b_free!5555 (not b_next!5555))))

(declare-fun tp!19717 () Bool)

(declare-fun b_and!12349 () Bool)

(assert (=> start!20984 (= tp!19717 b_and!12349)))

(declare-fun b!210852 () Bool)

(declare-fun res!102915 () Bool)

(declare-fun e!137284 () Bool)

(assert (=> b!210852 (=> (not res!102915) (not e!137284))))

(declare-datatypes ((array!10035 0))(
  ( (array!10036 (arr!4764 (Array (_ BitVec 32) (_ BitVec 64))) (size!5089 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10035)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210852 (= res!102915 (= (select (arr!4764 _keys!825) i!601) k!843))))

(declare-fun b!210853 () Bool)

(declare-fun e!137288 () Bool)

(declare-fun tp_is_empty!5417 () Bool)

(assert (=> b!210853 (= e!137288 tp_is_empty!5417)))

(declare-fun mapIsEmpty!9206 () Bool)

(declare-fun mapRes!9206 () Bool)

(assert (=> mapIsEmpty!9206 mapRes!9206))

(declare-fun b!210854 () Bool)

(declare-fun res!102911 () Bool)

(assert (=> b!210854 (=> (not res!102911) (not e!137284))))

(declare-datatypes ((List!3054 0))(
  ( (Nil!3051) (Cons!3050 (h!3692 (_ BitVec 64)) (t!7993 List!3054)) )
))
(declare-fun arrayNoDuplicates!0 (array!10035 (_ BitVec 32) List!3054) Bool)

(assert (=> b!210854 (= res!102911 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3051))))

(declare-fun b!210855 () Bool)

(declare-fun e!137282 () Bool)

(declare-datatypes ((V!6869 0))(
  ( (V!6870 (val!2753 Int)) )
))
(declare-datatypes ((ValueCell!2365 0))(
  ( (ValueCellFull!2365 (v!4739 V!6869)) (EmptyCell!2365) )
))
(declare-datatypes ((array!10037 0))(
  ( (array!10038 (arr!4765 (Array (_ BitVec 32) ValueCell!2365)) (size!5090 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10037)

(assert (=> b!210855 (= e!137282 (bvslt i!601 (size!5090 _values!649)))))

(declare-datatypes ((tuple2!4160 0))(
  ( (tuple2!4161 (_1!2091 (_ BitVec 64)) (_2!2091 V!6869)) )
))
(declare-fun lt!108230 () tuple2!4160)

(declare-fun lt!108228 () tuple2!4160)

(declare-datatypes ((List!3055 0))(
  ( (Nil!3052) (Cons!3051 (h!3693 tuple2!4160) (t!7994 List!3055)) )
))
(declare-datatypes ((ListLongMap!3073 0))(
  ( (ListLongMap!3074 (toList!1552 List!3055)) )
))
(declare-fun lt!108221 () ListLongMap!3073)

(declare-fun lt!108219 () ListLongMap!3073)

(declare-fun +!555 (ListLongMap!3073 tuple2!4160) ListLongMap!3073)

(assert (=> b!210855 (= (+!555 lt!108219 lt!108228) (+!555 lt!108221 lt!108230))))

(declare-fun lt!108222 () ListLongMap!3073)

(declare-fun minValue!615 () V!6869)

(declare-fun v!520 () V!6869)

(declare-datatypes ((Unit!6400 0))(
  ( (Unit!6401) )
))
(declare-fun lt!108227 () Unit!6400)

(declare-fun addCommutativeForDiffKeys!200 (ListLongMap!3073 (_ BitVec 64) V!6869 (_ BitVec 64) V!6869) Unit!6400)

(assert (=> b!210855 (= lt!108227 (addCommutativeForDiffKeys!200 lt!108222 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!210856 () Bool)

(declare-fun e!137285 () Bool)

(assert (=> b!210856 (= e!137285 e!137282)))

(declare-fun res!102913 () Bool)

(assert (=> b!210856 (=> res!102913 e!137282)))

(assert (=> b!210856 (= res!102913 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!108220 () ListLongMap!3073)

(assert (=> b!210856 (= lt!108220 lt!108219)))

(assert (=> b!210856 (= lt!108219 (+!555 lt!108222 lt!108230))))

(declare-fun lt!108218 () Unit!6400)

(declare-fun lt!108229 () ListLongMap!3073)

(declare-fun zeroValue!615 () V!6869)

(assert (=> b!210856 (= lt!108218 (addCommutativeForDiffKeys!200 lt!108229 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!108231 () ListLongMap!3073)

(assert (=> b!210856 (= lt!108231 (+!555 lt!108220 lt!108228))))

(declare-fun lt!108225 () ListLongMap!3073)

(declare-fun lt!108223 () tuple2!4160)

(assert (=> b!210856 (= lt!108220 (+!555 lt!108225 lt!108223))))

(declare-fun lt!108226 () ListLongMap!3073)

(assert (=> b!210856 (= lt!108226 lt!108221)))

(assert (=> b!210856 (= lt!108221 (+!555 lt!108222 lt!108228))))

(assert (=> b!210856 (= lt!108222 (+!555 lt!108229 lt!108223))))

(declare-fun lt!108216 () ListLongMap!3073)

(assert (=> b!210856 (= lt!108231 (+!555 (+!555 lt!108216 lt!108223) lt!108228))))

(assert (=> b!210856 (= lt!108228 (tuple2!4161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210856 (= lt!108223 (tuple2!4161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210857 () Bool)

(declare-fun e!137283 () Bool)

(assert (=> b!210857 (= e!137283 tp_is_empty!5417)))

(declare-fun b!210858 () Bool)

(declare-fun res!102914 () Bool)

(assert (=> b!210858 (=> (not res!102914) (not e!137284))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!210858 (= res!102914 (and (= (size!5090 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5089 _keys!825) (size!5090 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9206 () Bool)

(declare-fun tp!19718 () Bool)

(assert (=> mapNonEmpty!9206 (= mapRes!9206 (and tp!19718 e!137288))))

(declare-fun mapKey!9206 () (_ BitVec 32))

(declare-fun mapValue!9206 () ValueCell!2365)

(declare-fun mapRest!9206 () (Array (_ BitVec 32) ValueCell!2365))

(assert (=> mapNonEmpty!9206 (= (arr!4765 _values!649) (store mapRest!9206 mapKey!9206 mapValue!9206))))

(declare-fun res!102916 () Bool)

(assert (=> start!20984 (=> (not res!102916) (not e!137284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20984 (= res!102916 (validMask!0 mask!1149))))

(assert (=> start!20984 e!137284))

(declare-fun e!137286 () Bool)

(declare-fun array_inv!3155 (array!10037) Bool)

(assert (=> start!20984 (and (array_inv!3155 _values!649) e!137286)))

(assert (=> start!20984 true))

(assert (=> start!20984 tp_is_empty!5417))

(declare-fun array_inv!3156 (array!10035) Bool)

(assert (=> start!20984 (array_inv!3156 _keys!825)))

(assert (=> start!20984 tp!19717))

(declare-fun b!210859 () Bool)

(declare-fun res!102912 () Bool)

(assert (=> b!210859 (=> (not res!102912) (not e!137284))))

(assert (=> b!210859 (= res!102912 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5089 _keys!825))))))

(declare-fun b!210860 () Bool)

(declare-fun res!102918 () Bool)

(assert (=> b!210860 (=> (not res!102918) (not e!137284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210860 (= res!102918 (validKeyInArray!0 k!843))))

(declare-fun b!210861 () Bool)

(assert (=> b!210861 (= e!137286 (and e!137283 mapRes!9206))))

(declare-fun condMapEmpty!9206 () Bool)

(declare-fun mapDefault!9206 () ValueCell!2365)

