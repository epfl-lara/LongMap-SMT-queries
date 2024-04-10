; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42406 () Bool)

(assert start!42406)

(declare-fun b_free!11881 () Bool)

(declare-fun b_next!11881 () Bool)

(assert (=> start!42406 (= b_free!11881 (not b_next!11881))))

(declare-fun tp!41677 () Bool)

(declare-fun b_and!20337 () Bool)

(assert (=> start!42406 (= tp!41677 b_and!20337)))

(declare-fun mapNonEmpty!21676 () Bool)

(declare-fun mapRes!21676 () Bool)

(declare-fun tp!41676 () Bool)

(declare-fun e!277530 () Bool)

(assert (=> mapNonEmpty!21676 (= mapRes!21676 (and tp!41676 e!277530))))

(declare-datatypes ((V!18851 0))(
  ( (V!18852 (val!6699 Int)) )
))
(declare-datatypes ((ValueCell!6311 0))(
  ( (ValueCellFull!6311 (v!8990 V!18851)) (EmptyCell!6311) )
))
(declare-datatypes ((array!30377 0))(
  ( (array!30378 (arr!14608 (Array (_ BitVec 32) ValueCell!6311)) (size!14960 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30377)

(declare-fun mapKey!21676 () (_ BitVec 32))

(declare-fun mapValue!21676 () ValueCell!6311)

(declare-fun mapRest!21676 () (Array (_ BitVec 32) ValueCell!6311))

(assert (=> mapNonEmpty!21676 (= (arr!14608 _values!833) (store mapRest!21676 mapKey!21676 mapValue!21676))))

(declare-fun res!282614 () Bool)

(declare-fun e!277533 () Bool)

(assert (=> start!42406 (=> (not res!282614) (not e!277533))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42406 (= res!282614 (validMask!0 mask!1365))))

(assert (=> start!42406 e!277533))

(declare-fun tp_is_empty!13309 () Bool)

(assert (=> start!42406 tp_is_empty!13309))

(assert (=> start!42406 tp!41677))

(assert (=> start!42406 true))

(declare-datatypes ((array!30379 0))(
  ( (array!30380 (arr!14609 (Array (_ BitVec 32) (_ BitVec 64))) (size!14961 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30379)

(declare-fun array_inv!10538 (array!30379) Bool)

(assert (=> start!42406 (array_inv!10538 _keys!1025)))

(declare-fun e!277535 () Bool)

(declare-fun array_inv!10539 (array!30377) Bool)

(assert (=> start!42406 (and (array_inv!10539 _values!833) e!277535)))

(declare-fun b!473144 () Bool)

(declare-fun e!277531 () Bool)

(assert (=> b!473144 (= e!277535 (and e!277531 mapRes!21676))))

(declare-fun condMapEmpty!21676 () Bool)

(declare-fun mapDefault!21676 () ValueCell!6311)

