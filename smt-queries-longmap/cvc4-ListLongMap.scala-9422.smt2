; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112144 () Bool)

(assert start!112144)

(declare-fun b!1328161 () Bool)

(declare-fun e!757244 () Bool)

(declare-fun tp_is_empty!36449 () Bool)

(assert (=> b!1328161 (= e!757244 tp_is_empty!36449)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun b!1328162 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89796 0))(
  ( (array!89797 (arr!43364 (Array (_ BitVec 32) (_ BitVec 64))) (size!43914 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89796)

(declare-fun e!757243 () Bool)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1328162 (= e!757243 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43914 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!1980 (size!43914 _keys!1590))))))

(declare-fun b!1328163 () Bool)

(declare-fun e!757246 () Bool)

(declare-fun mapRes!56347 () Bool)

(assert (=> b!1328163 (= e!757246 (and e!757244 mapRes!56347))))

(declare-fun condMapEmpty!56347 () Bool)

(declare-datatypes ((V!53701 0))(
  ( (V!53702 (val!18299 Int)) )
))
(declare-datatypes ((ValueCell!17326 0))(
  ( (ValueCellFull!17326 (v!20936 V!53701)) (EmptyCell!17326) )
))
(declare-datatypes ((array!89798 0))(
  ( (array!89799 (arr!43365 (Array (_ BitVec 32) ValueCell!17326)) (size!43915 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89798)

(declare-fun mapDefault!56347 () ValueCell!17326)

