; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20176 () Bool)

(assert start!20176)

(declare-fun b_free!4835 () Bool)

(declare-fun b_next!4835 () Bool)

(assert (=> start!20176 (= b_free!4835 (not b_next!4835))))

(declare-fun tp!17537 () Bool)

(declare-fun b_and!11581 () Bool)

(assert (=> start!20176 (= tp!17537 b_and!11581)))

(declare-fun b!198074 () Bool)

(declare-fun res!93837 () Bool)

(declare-fun e!130241 () Bool)

(assert (=> b!198074 (=> (not res!93837) (not e!130241))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8633 0))(
  ( (array!8634 (arr!4067 (Array (_ BitVec 32) (_ BitVec 64))) (size!4392 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8633)

(assert (=> b!198074 (= res!93837 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4392 _keys!825))))))

(declare-fun b!198075 () Bool)

(declare-fun e!130244 () Bool)

(declare-fun tp_is_empty!4691 () Bool)

(assert (=> b!198075 (= e!130244 tp_is_empty!4691)))

(declare-fun b!198076 () Bool)

(declare-fun res!93835 () Bool)

(assert (=> b!198076 (=> (not res!93835) (not e!130241))))

(declare-datatypes ((List!2541 0))(
  ( (Nil!2538) (Cons!2537 (h!3179 (_ BitVec 64)) (t!7472 List!2541)) )
))
(declare-fun arrayNoDuplicates!0 (array!8633 (_ BitVec 32) List!2541) Bool)

(assert (=> b!198076 (= res!93835 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2538))))

(declare-fun b!198077 () Bool)

(declare-fun res!93836 () Bool)

(assert (=> b!198077 (=> (not res!93836) (not e!130241))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!198077 (= res!93836 (= (select (arr!4067 _keys!825) i!601) k!843))))

(declare-fun b!198078 () Bool)

(declare-fun res!93833 () Bool)

(assert (=> b!198078 (=> (not res!93833) (not e!130241))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5901 0))(
  ( (V!5902 (val!2390 Int)) )
))
(declare-datatypes ((ValueCell!2002 0))(
  ( (ValueCellFull!2002 (v!4360 V!5901)) (EmptyCell!2002) )
))
(declare-datatypes ((array!8635 0))(
  ( (array!8636 (arr!4068 (Array (_ BitVec 32) ValueCell!2002)) (size!4393 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8635)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198078 (= res!93833 (and (= (size!4393 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4392 _keys!825) (size!4393 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!93832 () Bool)

(assert (=> start!20176 (=> (not res!93832) (not e!130241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20176 (= res!93832 (validMask!0 mask!1149))))

(assert (=> start!20176 e!130241))

(declare-fun e!130243 () Bool)

(declare-fun array_inv!2659 (array!8635) Bool)

(assert (=> start!20176 (and (array_inv!2659 _values!649) e!130243)))

(assert (=> start!20176 true))

(assert (=> start!20176 tp_is_empty!4691))

(declare-fun array_inv!2660 (array!8633) Bool)

(assert (=> start!20176 (array_inv!2660 _keys!825)))

(assert (=> start!20176 tp!17537))

(declare-fun mapNonEmpty!8105 () Bool)

(declare-fun mapRes!8105 () Bool)

(declare-fun tp!17536 () Bool)

(assert (=> mapNonEmpty!8105 (= mapRes!8105 (and tp!17536 e!130244))))

(declare-fun mapKey!8105 () (_ BitVec 32))

(declare-fun mapValue!8105 () ValueCell!2002)

(declare-fun mapRest!8105 () (Array (_ BitVec 32) ValueCell!2002))

(assert (=> mapNonEmpty!8105 (= (arr!4068 _values!649) (store mapRest!8105 mapKey!8105 mapValue!8105))))

(declare-fun b!198079 () Bool)

(declare-fun e!130240 () Bool)

(assert (=> b!198079 (= e!130243 (and e!130240 mapRes!8105))))

(declare-fun condMapEmpty!8105 () Bool)

(declare-fun mapDefault!8105 () ValueCell!2002)

