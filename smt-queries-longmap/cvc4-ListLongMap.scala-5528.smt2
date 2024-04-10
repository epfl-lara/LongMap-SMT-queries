; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72956 () Bool)

(assert start!72956)

(declare-fun b_free!13871 () Bool)

(declare-fun b_next!13871 () Bool)

(assert (=> start!72956 (= b_free!13871 (not b_next!13871))))

(declare-fun tp!49116 () Bool)

(declare-fun b_and!22957 () Bool)

(assert (=> start!72956 (= tp!49116 b_and!22957)))

(declare-fun res!575665 () Bool)

(declare-fun e!472790 () Bool)

(assert (=> start!72956 (=> (not res!575665) (not e!472790))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48224 0))(
  ( (array!48225 (arr!23143 (Array (_ BitVec 32) (_ BitVec 64))) (size!23583 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48224)

(assert (=> start!72956 (= res!575665 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23583 _keys!868))))))

(assert (=> start!72956 e!472790))

(declare-fun tp_is_empty!16007 () Bool)

(assert (=> start!72956 tp_is_empty!16007))

(assert (=> start!72956 true))

(assert (=> start!72956 tp!49116))

(declare-fun array_inv!18382 (array!48224) Bool)

(assert (=> start!72956 (array_inv!18382 _keys!868)))

(declare-datatypes ((V!26389 0))(
  ( (V!26390 (val!8051 Int)) )
))
(declare-datatypes ((ValueCell!7564 0))(
  ( (ValueCellFull!7564 (v!10476 V!26389)) (EmptyCell!7564) )
))
(declare-datatypes ((array!48226 0))(
  ( (array!48227 (arr!23144 (Array (_ BitVec 32) ValueCell!7564)) (size!23584 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48226)

(declare-fun e!472791 () Bool)

(declare-fun array_inv!18383 (array!48226) Bool)

(assert (=> start!72956 (and (array_inv!18383 _values!688) e!472791)))

(declare-fun b!847255 () Bool)

(declare-fun res!575668 () Bool)

(assert (=> b!847255 (=> (not res!575668) (not e!472790))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847255 (= res!575668 (validKeyInArray!0 k!854))))

(declare-fun b!847256 () Bool)

(declare-fun res!575664 () Bool)

(assert (=> b!847256 (=> (not res!575664) (not e!472790))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!847256 (= res!575664 (and (= (size!23584 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23583 _keys!868) (size!23584 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847257 () Bool)

(declare-fun e!472789 () Bool)

(assert (=> b!847257 (= e!472789 tp_is_empty!16007)))

(declare-fun b!847258 () Bool)

(declare-fun res!575667 () Bool)

(assert (=> b!847258 (=> (not res!575667) (not e!472790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847258 (= res!575667 (validMask!0 mask!1196))))

(declare-fun b!847259 () Bool)

(declare-fun res!575662 () Bool)

(assert (=> b!847259 (=> (not res!575662) (not e!472790))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847259 (= res!575662 (and (= (select (arr!23143 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!847260 () Bool)

(declare-fun e!472792 () Bool)

(declare-fun mapRes!25610 () Bool)

(assert (=> b!847260 (= e!472791 (and e!472792 mapRes!25610))))

(declare-fun condMapEmpty!25610 () Bool)

(declare-fun mapDefault!25610 () ValueCell!7564)

