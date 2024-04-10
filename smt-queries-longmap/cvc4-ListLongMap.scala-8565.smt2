; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104590 () Bool)

(assert start!104590)

(declare-fun b!1247322 () Bool)

(declare-fun res!832304 () Bool)

(declare-fun e!707569 () Bool)

(assert (=> b!1247322 (=> (not res!832304) (not e!707569))))

(declare-datatypes ((array!80356 0))(
  ( (array!80357 (arr!38748 (Array (_ BitVec 32) (_ BitVec 64))) (size!39284 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80356)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80356 (_ BitVec 32)) Bool)

(assert (=> b!1247322 (= res!832304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247323 () Bool)

(declare-fun e!707571 () Bool)

(assert (=> b!1247323 (= e!707569 e!707571)))

(declare-fun res!832308 () Bool)

(assert (=> b!1247323 (=> res!832308 e!707571)))

(declare-datatypes ((List!27523 0))(
  ( (Nil!27520) (Cons!27519 (h!28728 (_ BitVec 64)) (t!40992 List!27523)) )
))
(declare-fun contains!7467 (List!27523 (_ BitVec 64)) Bool)

(assert (=> b!1247323 (= res!832308 (contains!7467 Nil!27520 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247324 () Bool)

(declare-fun res!832305 () Bool)

(assert (=> b!1247324 (=> (not res!832305) (not e!707569))))

(assert (=> b!1247324 (= res!832305 (and (bvsle #b00000000000000000000000000000000 (size!39284 _keys!1118)) (bvslt (size!39284 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun b!1247325 () Bool)

(declare-fun res!832309 () Bool)

(assert (=> b!1247325 (=> (not res!832309) (not e!707569))))

(declare-fun noDuplicate!2041 (List!27523) Bool)

(assert (=> b!1247325 (= res!832309 (noDuplicate!2041 Nil!27520))))

(declare-fun b!1247326 () Bool)

(assert (=> b!1247326 (= e!707571 (contains!7467 Nil!27520 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247327 () Bool)

(declare-fun e!707572 () Bool)

(declare-fun e!707570 () Bool)

(declare-fun mapRes!48748 () Bool)

(assert (=> b!1247327 (= e!707572 (and e!707570 mapRes!48748))))

(declare-fun condMapEmpty!48748 () Bool)

(declare-datatypes ((V!47139 0))(
  ( (V!47140 (val!15728 Int)) )
))
(declare-datatypes ((ValueCell!14902 0))(
  ( (ValueCellFull!14902 (v!18423 V!47139)) (EmptyCell!14902) )
))
(declare-datatypes ((array!80358 0))(
  ( (array!80359 (arr!38749 (Array (_ BitVec 32) ValueCell!14902)) (size!39285 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80358)

(declare-fun mapDefault!48748 () ValueCell!14902)

