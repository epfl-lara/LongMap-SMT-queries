; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73706 () Bool)

(assert start!73706)

(declare-fun b_free!14621 () Bool)

(declare-fun b_next!14621 () Bool)

(assert (=> start!73706 (= b_free!14621 (not b_next!14621))))

(declare-fun tp!51367 () Bool)

(declare-fun b_and!24221 () Bool)

(assert (=> start!73706 (= tp!51367 b_and!24221)))

(declare-fun b!863775 () Bool)

(declare-fun res!586948 () Bool)

(declare-fun e!481211 () Bool)

(assert (=> b!863775 (=> (not res!586948) (not e!481211))))

(declare-datatypes ((array!49676 0))(
  ( (array!49677 (arr!23869 (Array (_ BitVec 32) (_ BitVec 64))) (size!24309 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49676)

(declare-datatypes ((List!16960 0))(
  ( (Nil!16957) (Cons!16956 (h!18087 (_ BitVec 64)) (t!23847 List!16960)) )
))
(declare-fun arrayNoDuplicates!0 (array!49676 (_ BitVec 32) List!16960) Bool)

(assert (=> b!863775 (= res!586948 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16957))))

(declare-fun b!863776 () Bool)

(declare-fun e!481212 () Bool)

(assert (=> b!863776 (= e!481212 true)))

(declare-datatypes ((V!27389 0))(
  ( (V!27390 (val!8426 Int)) )
))
(declare-datatypes ((tuple2!11154 0))(
  ( (tuple2!11155 (_1!5588 (_ BitVec 64)) (_2!5588 V!27389)) )
))
(declare-datatypes ((List!16961 0))(
  ( (Nil!16958) (Cons!16957 (h!18088 tuple2!11154) (t!23848 List!16961)) )
))
(declare-datatypes ((ListLongMap!9923 0))(
  ( (ListLongMap!9924 (toList!4977 List!16961)) )
))
(declare-fun lt!390557 () ListLongMap!9923)

(declare-fun lt!390553 () tuple2!11154)

(declare-fun lt!390555 () ListLongMap!9923)

(declare-fun lt!390563 () tuple2!11154)

(declare-fun +!2326 (ListLongMap!9923 tuple2!11154) ListLongMap!9923)

(assert (=> b!863776 (= lt!390557 (+!2326 (+!2326 lt!390555 lt!390553) lt!390563))))

(declare-datatypes ((Unit!29534 0))(
  ( (Unit!29535) )
))
(declare-fun lt!390556 () Unit!29534)

(declare-fun v!557 () V!27389)

(declare-fun lt!390560 () V!27389)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!499 (ListLongMap!9923 (_ BitVec 64) V!27389 (_ BitVec 64) V!27389) Unit!29534)

(assert (=> b!863776 (= lt!390556 (addCommutativeForDiffKeys!499 lt!390555 k!854 v!557 (select (arr!23869 _keys!868) from!1053) lt!390560))))

(declare-fun b!863777 () Bool)

(declare-fun res!586950 () Bool)

(assert (=> b!863777 (=> (not res!586950) (not e!481211))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49676 (_ BitVec 32)) Bool)

(assert (=> b!863777 (= res!586950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863778 () Bool)

(declare-fun e!481208 () Bool)

(declare-fun e!481214 () Bool)

(declare-fun mapRes!26735 () Bool)

(assert (=> b!863778 (= e!481208 (and e!481214 mapRes!26735))))

(declare-fun condMapEmpty!26735 () Bool)

(declare-datatypes ((ValueCell!7939 0))(
  ( (ValueCellFull!7939 (v!10851 V!27389)) (EmptyCell!7939) )
))
(declare-datatypes ((array!49678 0))(
  ( (array!49679 (arr!23870 (Array (_ BitVec 32) ValueCell!7939)) (size!24310 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49678)

(declare-fun mapDefault!26735 () ValueCell!7939)

