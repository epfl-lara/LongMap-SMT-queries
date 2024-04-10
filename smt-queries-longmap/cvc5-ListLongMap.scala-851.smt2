; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20202 () Bool)

(assert start!20202)

(declare-fun b_free!4861 () Bool)

(declare-fun b_next!4861 () Bool)

(assert (=> start!20202 (= b_free!4861 (not b_next!4861))))

(declare-fun tp!17614 () Bool)

(declare-fun b_and!11607 () Bool)

(assert (=> start!20202 (= tp!17614 b_and!11607)))

(declare-fun b!198464 () Bool)

(declare-fun res!94105 () Bool)

(declare-fun e!130436 () Bool)

(assert (=> b!198464 (=> (not res!94105) (not e!130436))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8683 0))(
  ( (array!8684 (arr!4092 (Array (_ BitVec 32) (_ BitVec 64))) (size!4417 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8683)

(assert (=> b!198464 (= res!94105 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4417 _keys!825))))))

(declare-fun res!94110 () Bool)

(assert (=> start!20202 (=> (not res!94110) (not e!130436))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20202 (= res!94110 (validMask!0 mask!1149))))

(assert (=> start!20202 e!130436))

(declare-datatypes ((V!5937 0))(
  ( (V!5938 (val!2403 Int)) )
))
(declare-datatypes ((ValueCell!2015 0))(
  ( (ValueCellFull!2015 (v!4373 V!5937)) (EmptyCell!2015) )
))
(declare-datatypes ((array!8685 0))(
  ( (array!8686 (arr!4093 (Array (_ BitVec 32) ValueCell!2015)) (size!4418 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8685)

(declare-fun e!130437 () Bool)

(declare-fun array_inv!2679 (array!8685) Bool)

(assert (=> start!20202 (and (array_inv!2679 _values!649) e!130437)))

(assert (=> start!20202 true))

(declare-fun tp_is_empty!4717 () Bool)

(assert (=> start!20202 tp_is_empty!4717))

(declare-fun array_inv!2680 (array!8683) Bool)

(assert (=> start!20202 (array_inv!2680 _keys!825)))

(assert (=> start!20202 tp!17614))

(declare-fun mapNonEmpty!8144 () Bool)

(declare-fun mapRes!8144 () Bool)

(declare-fun tp!17615 () Bool)

(declare-fun e!130438 () Bool)

(assert (=> mapNonEmpty!8144 (= mapRes!8144 (and tp!17615 e!130438))))

(declare-fun mapKey!8144 () (_ BitVec 32))

(declare-fun mapRest!8144 () (Array (_ BitVec 32) ValueCell!2015))

(declare-fun mapValue!8144 () ValueCell!2015)

(assert (=> mapNonEmpty!8144 (= (arr!4093 _values!649) (store mapRest!8144 mapKey!8144 mapValue!8144))))

(declare-fun b!198465 () Bool)

(declare-fun e!130439 () Bool)

(assert (=> b!198465 (= e!130437 (and e!130439 mapRes!8144))))

(declare-fun condMapEmpty!8144 () Bool)

(declare-fun mapDefault!8144 () ValueCell!2015)

