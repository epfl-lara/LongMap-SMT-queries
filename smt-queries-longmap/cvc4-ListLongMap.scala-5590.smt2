; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73328 () Bool)

(assert start!73328)

(declare-fun b_free!14243 () Bool)

(declare-fun b_next!14243 () Bool)

(assert (=> start!73328 (= b_free!14243 (not b_next!14243))))

(declare-fun tp!50232 () Bool)

(declare-fun b_and!23599 () Bool)

(assert (=> start!73328 (= tp!50232 b_and!23599)))

(declare-fun b!855535 () Bool)

(declare-fun res!581028 () Bool)

(declare-fun e!476967 () Bool)

(assert (=> b!855535 (=> (not res!581028) (not e!476967))))

(declare-datatypes ((array!48954 0))(
  ( (array!48955 (arr!23508 (Array (_ BitVec 32) (_ BitVec 64))) (size!23948 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48954)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48954 (_ BitVec 32)) Bool)

(assert (=> b!855535 (= res!581028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855536 () Bool)

(declare-fun res!581026 () Bool)

(assert (=> b!855536 (=> (not res!581026) (not e!476967))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26885 0))(
  ( (V!26886 (val!8237 Int)) )
))
(declare-datatypes ((ValueCell!7750 0))(
  ( (ValueCellFull!7750 (v!10662 V!26885)) (EmptyCell!7750) )
))
(declare-datatypes ((array!48956 0))(
  ( (array!48957 (arr!23509 (Array (_ BitVec 32) ValueCell!7750)) (size!23949 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48956)

(assert (=> b!855536 (= res!581026 (and (= (size!23949 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23948 _keys!868) (size!23949 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855537 () Bool)

(declare-fun res!581029 () Bool)

(assert (=> b!855537 (=> (not res!581029) (not e!476967))))

(declare-datatypes ((List!16668 0))(
  ( (Nil!16665) (Cons!16664 (h!17795 (_ BitVec 64)) (t!23309 List!16668)) )
))
(declare-fun arrayNoDuplicates!0 (array!48954 (_ BitVec 32) List!16668) Bool)

(assert (=> b!855537 (= res!581029 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16665))))

(declare-fun res!581032 () Bool)

(assert (=> start!73328 (=> (not res!581032) (not e!476967))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73328 (= res!581032 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23948 _keys!868))))))

(assert (=> start!73328 e!476967))

(declare-fun tp_is_empty!16379 () Bool)

(assert (=> start!73328 tp_is_empty!16379))

(assert (=> start!73328 true))

(assert (=> start!73328 tp!50232))

(declare-fun array_inv!18626 (array!48954) Bool)

(assert (=> start!73328 (array_inv!18626 _keys!868)))

(declare-fun e!476964 () Bool)

(declare-fun array_inv!18627 (array!48956) Bool)

(assert (=> start!73328 (and (array_inv!18627 _values!688) e!476964)))

(declare-fun b!855538 () Bool)

(declare-fun res!581027 () Bool)

(assert (=> b!855538 (=> (not res!581027) (not e!476967))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855538 (= res!581027 (validKeyInArray!0 k!854))))

(declare-fun b!855539 () Bool)

(declare-fun res!581031 () Bool)

(assert (=> b!855539 (=> (not res!581031) (not e!476967))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855539 (= res!581031 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23948 _keys!868))))))

(declare-fun b!855540 () Bool)

(declare-fun e!476968 () Bool)

(assert (=> b!855540 (= e!476968 tp_is_empty!16379)))

(declare-fun b!855541 () Bool)

(declare-fun e!476966 () Bool)

(declare-fun mapRes!26168 () Bool)

(assert (=> b!855541 (= e!476964 (and e!476966 mapRes!26168))))

(declare-fun condMapEmpty!26168 () Bool)

(declare-fun mapDefault!26168 () ValueCell!7750)

