; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73412 () Bool)

(assert start!73412)

(declare-fun b_free!14327 () Bool)

(declare-fun b_next!14327 () Bool)

(assert (=> start!73412 (= b_free!14327 (not b_next!14327))))

(declare-fun tp!50484 () Bool)

(declare-fun b_and!23683 () Bool)

(assert (=> start!73412 (= tp!50484 b_and!23683)))

(declare-fun b!857010 () Bool)

(declare-fun res!582129 () Bool)

(declare-fun e!477683 () Bool)

(assert (=> b!857010 (=> (not res!582129) (not e!477683))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49118 0))(
  ( (array!49119 (arr!23590 (Array (_ BitVec 32) (_ BitVec 64))) (size!24030 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49118)

(declare-datatypes ((V!26997 0))(
  ( (V!26998 (val!8279 Int)) )
))
(declare-datatypes ((ValueCell!7792 0))(
  ( (ValueCellFull!7792 (v!10704 V!26997)) (EmptyCell!7792) )
))
(declare-datatypes ((array!49120 0))(
  ( (array!49121 (arr!23591 (Array (_ BitVec 32) ValueCell!7792)) (size!24031 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49120)

(assert (=> b!857010 (= res!582129 (and (= (size!24031 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24030 _keys!868) (size!24031 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857011 () Bool)

(declare-fun e!477687 () Bool)

(declare-fun tp_is_empty!16463 () Bool)

(assert (=> b!857011 (= e!477687 tp_is_empty!16463)))

(declare-fun mapNonEmpty!26294 () Bool)

(declare-fun mapRes!26294 () Bool)

(declare-fun tp!50485 () Bool)

(declare-fun e!477688 () Bool)

(assert (=> mapNonEmpty!26294 (= mapRes!26294 (and tp!50485 e!477688))))

(declare-fun mapKey!26294 () (_ BitVec 32))

(declare-fun mapRest!26294 () (Array (_ BitVec 32) ValueCell!7792))

(declare-fun mapValue!26294 () ValueCell!7792)

(assert (=> mapNonEmpty!26294 (= (arr!23591 _values!688) (store mapRest!26294 mapKey!26294 mapValue!26294))))

(declare-fun b!857012 () Bool)

(declare-fun res!582131 () Bool)

(assert (=> b!857012 (=> (not res!582131) (not e!477683))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857012 (= res!582131 (validKeyInArray!0 k!854))))

(declare-fun res!582126 () Bool)

(assert (=> start!73412 (=> (not res!582126) (not e!477683))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73412 (= res!582126 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24030 _keys!868))))))

(assert (=> start!73412 e!477683))

(assert (=> start!73412 tp_is_empty!16463))

(assert (=> start!73412 true))

(assert (=> start!73412 tp!50484))

(declare-fun array_inv!18682 (array!49118) Bool)

(assert (=> start!73412 (array_inv!18682 _keys!868)))

(declare-fun e!477684 () Bool)

(declare-fun array_inv!18683 (array!49120) Bool)

(assert (=> start!73412 (and (array_inv!18683 _values!688) e!477684)))

(declare-fun b!857013 () Bool)

(declare-fun res!582125 () Bool)

(assert (=> b!857013 (=> (not res!582125) (not e!477683))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857013 (= res!582125 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24030 _keys!868))))))

(declare-fun b!857014 () Bool)

(declare-fun res!582123 () Bool)

(assert (=> b!857014 (=> (not res!582123) (not e!477683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49118 (_ BitVec 32)) Bool)

(assert (=> b!857014 (= res!582123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857015 () Bool)

(assert (=> b!857015 (= e!477684 (and e!477687 mapRes!26294))))

(declare-fun condMapEmpty!26294 () Bool)

(declare-fun mapDefault!26294 () ValueCell!7792)

