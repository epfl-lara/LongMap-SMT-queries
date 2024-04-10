; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95490 () Bool)

(assert start!95490)

(declare-fun res!718544 () Bool)

(declare-fun e!616573 () Bool)

(assert (=> start!95490 (=> (not res!718544) (not e!616573))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95490 (= res!718544 (validMask!0 mask!1414))))

(assert (=> start!95490 e!616573))

(assert (=> start!95490 true))

(declare-datatypes ((array!69277 0))(
  ( (array!69278 (arr!33313 (Array (_ BitVec 32) (_ BitVec 64))) (size!33849 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69277)

(declare-fun array_inv!25730 (array!69277) Bool)

(assert (=> start!95490 (array_inv!25730 _keys!1070)))

(declare-datatypes ((V!40009 0))(
  ( (V!40010 (val!13137 Int)) )
))
(declare-datatypes ((ValueCell!12371 0))(
  ( (ValueCellFull!12371 (v!15758 V!40009)) (EmptyCell!12371) )
))
(declare-datatypes ((array!69279 0))(
  ( (array!69280 (arr!33314 (Array (_ BitVec 32) ValueCell!12371)) (size!33850 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69279)

(declare-fun e!616572 () Bool)

(declare-fun array_inv!25731 (array!69279) Bool)

(assert (=> start!95490 (and (array_inv!25731 _values!874) e!616572)))

(declare-fun b!1078352 () Bool)

(declare-fun e!616571 () Bool)

(assert (=> b!1078352 (= e!616571 false)))

(declare-fun lt!478621 () Bool)

(declare-fun lt!478620 () array!69277)

(declare-datatypes ((List!23236 0))(
  ( (Nil!23233) (Cons!23232 (h!24441 (_ BitVec 64)) (t!32595 List!23236)) )
))
(declare-fun arrayNoDuplicates!0 (array!69277 (_ BitVec 32) List!23236) Bool)

(assert (=> b!1078352 (= lt!478621 (arrayNoDuplicates!0 lt!478620 #b00000000000000000000000000000000 Nil!23233))))

(declare-fun b!1078353 () Bool)

(assert (=> b!1078353 (= e!616573 e!616571)))

(declare-fun res!718543 () Bool)

(assert (=> b!1078353 (=> (not res!718543) (not e!616571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69277 (_ BitVec 32)) Bool)

(assert (=> b!1078353 (= res!718543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478620 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078353 (= lt!478620 (array!69278 (store (arr!33313 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33849 _keys!1070)))))

(declare-fun b!1078354 () Bool)

(declare-fun res!718547 () Bool)

(assert (=> b!1078354 (=> (not res!718547) (not e!616573))))

(assert (=> b!1078354 (= res!718547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078355 () Bool)

(declare-fun e!616569 () Bool)

(declare-fun mapRes!40993 () Bool)

(assert (=> b!1078355 (= e!616572 (and e!616569 mapRes!40993))))

(declare-fun condMapEmpty!40993 () Bool)

(declare-fun mapDefault!40993 () ValueCell!12371)

