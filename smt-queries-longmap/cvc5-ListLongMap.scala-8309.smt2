; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101202 () Bool)

(assert start!101202)

(declare-fun b_free!26125 () Bool)

(declare-fun b_next!26125 () Bool)

(assert (=> start!101202 (= b_free!26125 (not b_next!26125))))

(declare-fun tp!91397 () Bool)

(declare-fun b_and!43367 () Bool)

(assert (=> start!101202 (= tp!91397 b_and!43367)))

(declare-fun b!1215024 () Bool)

(declare-fun res!806697 () Bool)

(declare-fun e!689948 () Bool)

(assert (=> b!1215024 (=> (not res!806697) (not e!689948))))

(declare-datatypes ((array!78437 0))(
  ( (array!78438 (arr!37853 (Array (_ BitVec 32) (_ BitVec 64))) (size!38389 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78437)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78437 (_ BitVec 32)) Bool)

(assert (=> b!1215024 (= res!806697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215025 () Bool)

(declare-fun e!689947 () Bool)

(declare-fun tp_is_empty!30829 () Bool)

(assert (=> b!1215025 (= e!689947 tp_is_empty!30829)))

(declare-fun res!806699 () Bool)

(assert (=> start!101202 (=> (not res!806699) (not e!689948))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101202 (= res!806699 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38389 _keys!1208))))))

(assert (=> start!101202 e!689948))

(assert (=> start!101202 tp_is_empty!30829))

(declare-fun array_inv!28824 (array!78437) Bool)

(assert (=> start!101202 (array_inv!28824 _keys!1208)))

(assert (=> start!101202 true))

(assert (=> start!101202 tp!91397))

(declare-datatypes ((V!46233 0))(
  ( (V!46234 (val!15471 Int)) )
))
(declare-datatypes ((ValueCell!14705 0))(
  ( (ValueCellFull!14705 (v!18124 V!46233)) (EmptyCell!14705) )
))
(declare-datatypes ((array!78439 0))(
  ( (array!78440 (arr!37854 (Array (_ BitVec 32) ValueCell!14705)) (size!38390 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78439)

(declare-fun e!689949 () Bool)

(declare-fun array_inv!28825 (array!78439) Bool)

(assert (=> start!101202 (and (array_inv!28825 _values!996) e!689949)))

(declare-fun b!1215026 () Bool)

(declare-fun mapRes!48118 () Bool)

(assert (=> b!1215026 (= e!689949 (and e!689947 mapRes!48118))))

(declare-fun condMapEmpty!48118 () Bool)

(declare-fun mapDefault!48118 () ValueCell!14705)

