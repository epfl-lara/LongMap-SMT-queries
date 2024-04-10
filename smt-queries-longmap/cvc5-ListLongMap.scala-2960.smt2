; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41996 () Bool)

(assert start!41996)

(declare-fun b_free!11569 () Bool)

(declare-fun b_next!11569 () Bool)

(assert (=> start!41996 (= b_free!11569 (not b_next!11569))))

(declare-fun tp!40723 () Bool)

(declare-fun b_and!19967 () Bool)

(assert (=> start!41996 (= tp!40723 b_and!19967)))

(declare-fun b!468882 () Bool)

(declare-fun res!280210 () Bool)

(declare-fun e!274483 () Bool)

(assert (=> b!468882 (=> (not res!280210) (not e!274483))))

(declare-datatypes ((array!29767 0))(
  ( (array!29768 (arr!14309 (Array (_ BitVec 32) (_ BitVec 64))) (size!14661 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29767)

(declare-datatypes ((List!8687 0))(
  ( (Nil!8684) (Cons!8683 (h!9539 (_ BitVec 64)) (t!14645 List!8687)) )
))
(declare-fun arrayNoDuplicates!0 (array!29767 (_ BitVec 32) List!8687) Bool)

(assert (=> b!468882 (= res!280210 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8684))))

(declare-fun mapIsEmpty!21190 () Bool)

(declare-fun mapRes!21190 () Bool)

(assert (=> mapIsEmpty!21190 mapRes!21190))

(declare-fun b!468883 () Bool)

(declare-fun e!274485 () Bool)

(declare-fun tp_is_empty!12997 () Bool)

(assert (=> b!468883 (= e!274485 tp_is_empty!12997)))

(declare-fun b!468884 () Bool)

(declare-fun e!274484 () Bool)

(declare-fun e!274482 () Bool)

(assert (=> b!468884 (= e!274484 (and e!274482 mapRes!21190))))

(declare-fun condMapEmpty!21190 () Bool)

(declare-datatypes ((V!18435 0))(
  ( (V!18436 (val!6543 Int)) )
))
(declare-datatypes ((ValueCell!6155 0))(
  ( (ValueCellFull!6155 (v!8832 V!18435)) (EmptyCell!6155) )
))
(declare-datatypes ((array!29769 0))(
  ( (array!29770 (arr!14310 (Array (_ BitVec 32) ValueCell!6155)) (size!14662 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29769)

(declare-fun mapDefault!21190 () ValueCell!6155)

