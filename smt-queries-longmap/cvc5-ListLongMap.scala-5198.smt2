; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70202 () Bool)

(assert start!70202)

(declare-fun b_free!12595 () Bool)

(declare-fun b_next!12595 () Bool)

(assert (=> start!70202 (= b_free!12595 (not b_next!12595))))

(declare-fun tp!44505 () Bool)

(declare-fun b_and!21383 () Bool)

(assert (=> start!70202 (= tp!44505 b_and!21383)))

(declare-fun res!556901 () Bool)

(declare-fun e!452265 () Bool)

(assert (=> start!70202 (=> (not res!556901) (not e!452265))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70202 (= res!556901 (validMask!0 mask!1312))))

(assert (=> start!70202 e!452265))

(declare-fun tp_is_empty!14305 () Bool)

(assert (=> start!70202 tp_is_empty!14305))

(declare-datatypes ((array!44812 0))(
  ( (array!44813 (arr!21464 (Array (_ BitVec 32) (_ BitVec 64))) (size!21885 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44812)

(declare-fun array_inv!17175 (array!44812) Bool)

(assert (=> start!70202 (array_inv!17175 _keys!976)))

(assert (=> start!70202 true))

(declare-datatypes ((V!24075 0))(
  ( (V!24076 (val!7200 Int)) )
))
(declare-datatypes ((ValueCell!6737 0))(
  ( (ValueCellFull!6737 (v!9627 V!24075)) (EmptyCell!6737) )
))
(declare-datatypes ((array!44814 0))(
  ( (array!44815 (arr!21465 (Array (_ BitVec 32) ValueCell!6737)) (size!21886 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44814)

(declare-fun e!452266 () Bool)

(declare-fun array_inv!17176 (array!44814) Bool)

(assert (=> start!70202 (and (array_inv!17176 _values!788) e!452266)))

(assert (=> start!70202 tp!44505))

(declare-fun b!815583 () Bool)

(declare-fun e!452267 () Bool)

(assert (=> b!815583 (= e!452267 tp_is_empty!14305)))

(declare-fun b!815584 () Bool)

(declare-fun mapRes!23044 () Bool)

(assert (=> b!815584 (= e!452266 (and e!452267 mapRes!23044))))

(declare-fun condMapEmpty!23044 () Bool)

(declare-fun mapDefault!23044 () ValueCell!6737)

