; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74570 () Bool)

(assert start!74570)

(declare-fun b_free!15259 () Bool)

(declare-fun b_next!15259 () Bool)

(assert (=> start!74570 (= b_free!15259 (not b_next!15259))))

(declare-fun tp!53459 () Bool)

(declare-fun b_and!25135 () Bool)

(assert (=> start!74570 (= tp!53459 b_and!25135)))

(declare-fun b!878609 () Bool)

(declare-fun e!488979 () Bool)

(declare-fun tp_is_empty!17503 () Bool)

(assert (=> b!878609 (= e!488979 tp_is_empty!17503)))

(declare-fun res!596911 () Bool)

(declare-fun e!488978 () Bool)

(assert (=> start!74570 (=> (not res!596911) (not e!488978))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51132 0))(
  ( (array!51133 (arr!24592 (Array (_ BitVec 32) (_ BitVec 64))) (size!25032 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51132)

(assert (=> start!74570 (= res!596911 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25032 _keys!868))))))

(assert (=> start!74570 e!488978))

(assert (=> start!74570 tp_is_empty!17503))

(assert (=> start!74570 true))

(assert (=> start!74570 tp!53459))

(declare-fun array_inv!19380 (array!51132) Bool)

(assert (=> start!74570 (array_inv!19380 _keys!868)))

(declare-datatypes ((V!28385 0))(
  ( (V!28386 (val!8799 Int)) )
))
(declare-datatypes ((ValueCell!8312 0))(
  ( (ValueCellFull!8312 (v!11239 V!28385)) (EmptyCell!8312) )
))
(declare-datatypes ((array!51134 0))(
  ( (array!51135 (arr!24593 (Array (_ BitVec 32) ValueCell!8312)) (size!25033 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51134)

(declare-fun e!488980 () Bool)

(declare-fun array_inv!19381 (array!51134) Bool)

(assert (=> start!74570 (and (array_inv!19381 _values!688) e!488980)))

(declare-fun b!878610 () Bool)

(declare-fun res!596905 () Bool)

(assert (=> b!878610 (=> (not res!596905) (not e!488978))))

(declare-datatypes ((List!17450 0))(
  ( (Nil!17447) (Cons!17446 (h!18577 (_ BitVec 64)) (t!24539 List!17450)) )
))
(declare-fun arrayNoDuplicates!0 (array!51132 (_ BitVec 32) List!17450) Bool)

(assert (=> b!878610 (= res!596905 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17447))))

(declare-fun b!878611 () Bool)

(declare-fun res!596910 () Bool)

(assert (=> b!878611 (=> (not res!596910) (not e!488978))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51132 (_ BitVec 32)) Bool)

(assert (=> b!878611 (= res!596910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878612 () Bool)

(declare-fun res!596906 () Bool)

(assert (=> b!878612 (=> (not res!596906) (not e!488978))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!878612 (= res!596906 (and (= (select (arr!24592 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!878613 () Bool)

(declare-fun res!596909 () Bool)

(assert (=> b!878613 (=> (not res!596909) (not e!488978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878613 (= res!596909 (validKeyInArray!0 k!854))))

(declare-fun b!878614 () Bool)

(declare-fun e!488977 () Bool)

(assert (=> b!878614 (= e!488977 tp_is_empty!17503)))

(declare-fun b!878615 () Bool)

(declare-fun mapRes!27870 () Bool)

(assert (=> b!878615 (= e!488980 (and e!488979 mapRes!27870))))

(declare-fun condMapEmpty!27870 () Bool)

(declare-fun mapDefault!27870 () ValueCell!8312)

