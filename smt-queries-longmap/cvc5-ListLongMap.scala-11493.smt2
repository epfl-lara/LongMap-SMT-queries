; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133756 () Bool)

(assert start!133756)

(declare-fun res!1069278 () Bool)

(declare-fun e!871723 () Bool)

(assert (=> start!133756 (=> (not res!1069278) (not e!871723))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133756 (= res!1069278 (validMask!0 mask!947))))

(assert (=> start!133756 e!871723))

(assert (=> start!133756 true))

(declare-datatypes ((array!104370 0))(
  ( (array!104371 (arr!50377 (Array (_ BitVec 32) (_ BitVec 64))) (size!50927 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104370)

(declare-fun array_inv!39149 (array!104370) Bool)

(assert (=> start!133756 (array_inv!39149 _keys!637)))

(declare-datatypes ((V!59993 0))(
  ( (V!59994 (val!19503 Int)) )
))
(declare-datatypes ((ValueCell!18389 0))(
  ( (ValueCellFull!18389 (v!22255 V!59993)) (EmptyCell!18389) )
))
(declare-datatypes ((array!104372 0))(
  ( (array!104373 (arr!50378 (Array (_ BitVec 32) ValueCell!18389)) (size!50928 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104372)

(declare-fun e!871722 () Bool)

(declare-fun array_inv!39150 (array!104372) Bool)

(assert (=> start!133756 (and (array_inv!39150 _values!487) e!871722)))

(declare-fun b!1564058 () Bool)

(declare-fun e!871720 () Bool)

(declare-fun mapRes!59634 () Bool)

(assert (=> b!1564058 (= e!871722 (and e!871720 mapRes!59634))))

(declare-fun condMapEmpty!59634 () Bool)

(declare-fun mapDefault!59634 () ValueCell!18389)

