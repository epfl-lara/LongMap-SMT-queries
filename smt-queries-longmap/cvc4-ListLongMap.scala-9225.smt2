; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110702 () Bool)

(assert start!110702)

(declare-fun b_free!29537 () Bool)

(declare-fun b_next!29537 () Bool)

(assert (=> start!110702 (= b_free!29537 (not b_next!29537))))

(declare-fun tp!103933 () Bool)

(declare-fun b_and!47745 () Bool)

(assert (=> start!110702 (= tp!103933 b_and!47745)))

(declare-fun b!1310011 () Bool)

(declare-fun res!869641 () Bool)

(declare-fun e!747390 () Bool)

(assert (=> b!1310011 (=> (not res!869641) (not e!747390))))

(declare-datatypes ((array!87524 0))(
  ( (array!87525 (arr!42242 (Array (_ BitVec 32) (_ BitVec 64))) (size!42792 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87524)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87524 (_ BitVec 32)) Bool)

(assert (=> b!1310011 (= res!869641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!869639 () Bool)

(assert (=> start!110702 (=> (not res!869639) (not e!747390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110702 (= res!869639 (validMask!0 mask!2040))))

(assert (=> start!110702 e!747390))

(assert (=> start!110702 tp!103933))

(declare-fun array_inv!31921 (array!87524) Bool)

(assert (=> start!110702 (array_inv!31921 _keys!1628)))

(assert (=> start!110702 true))

(declare-fun tp_is_empty!35267 () Bool)

(assert (=> start!110702 tp_is_empty!35267))

(declare-datatypes ((V!52125 0))(
  ( (V!52126 (val!17708 Int)) )
))
(declare-datatypes ((ValueCell!16735 0))(
  ( (ValueCellFull!16735 (v!20335 V!52125)) (EmptyCell!16735) )
))
(declare-datatypes ((array!87526 0))(
  ( (array!87527 (arr!42243 (Array (_ BitVec 32) ValueCell!16735)) (size!42793 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87526)

(declare-fun e!747391 () Bool)

(declare-fun array_inv!31922 (array!87526) Bool)

(assert (=> start!110702 (and (array_inv!31922 _values!1354) e!747391)))

(declare-fun b!1310012 () Bool)

(declare-fun e!747389 () Bool)

(declare-fun mapRes!54529 () Bool)

(assert (=> b!1310012 (= e!747391 (and e!747389 mapRes!54529))))

(declare-fun condMapEmpty!54529 () Bool)

(declare-fun mapDefault!54529 () ValueCell!16735)

