; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70730 () Bool)

(assert start!70730)

(declare-fun b_free!13003 () Bool)

(declare-fun b_next!13003 () Bool)

(assert (=> start!70730 (= b_free!13003 (not b_next!13003))))

(declare-fun tp!45751 () Bool)

(declare-fun b_and!21865 () Bool)

(assert (=> start!70730 (= tp!45751 b_and!21865)))

(declare-fun mapIsEmpty!23677 () Bool)

(declare-fun mapRes!23677 () Bool)

(assert (=> mapIsEmpty!23677 mapRes!23677))

(declare-fun res!560432 () Bool)

(declare-fun e!456611 () Bool)

(assert (=> start!70730 (=> (not res!560432) (not e!456611))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70730 (= res!560432 (validMask!0 mask!1312))))

(assert (=> start!70730 e!456611))

(declare-fun tp_is_empty!14713 () Bool)

(assert (=> start!70730 tp_is_empty!14713))

(declare-datatypes ((array!45622 0))(
  ( (array!45623 (arr!21862 (Array (_ BitVec 32) (_ BitVec 64))) (size!22283 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45622)

(declare-fun array_inv!17469 (array!45622) Bool)

(assert (=> start!70730 (array_inv!17469 _keys!976)))

(assert (=> start!70730 true))

(declare-datatypes ((V!24619 0))(
  ( (V!24620 (val!7404 Int)) )
))
(declare-datatypes ((ValueCell!6941 0))(
  ( (ValueCellFull!6941 (v!9835 V!24619)) (EmptyCell!6941) )
))
(declare-datatypes ((array!45624 0))(
  ( (array!45625 (arr!21863 (Array (_ BitVec 32) ValueCell!6941)) (size!22284 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45624)

(declare-fun e!456614 () Bool)

(declare-fun array_inv!17470 (array!45624) Bool)

(assert (=> start!70730 (and (array_inv!17470 _values!788) e!456614)))

(assert (=> start!70730 tp!45751))

(declare-fun b!821553 () Bool)

(declare-fun e!456612 () Bool)

(assert (=> b!821553 (= e!456612 true)))

(declare-fun zeroValueBefore!34 () V!24619)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((tuple2!9770 0))(
  ( (tuple2!9771 (_1!4896 (_ BitVec 64)) (_2!4896 V!24619)) )
))
(declare-datatypes ((List!15587 0))(
  ( (Nil!15584) (Cons!15583 (h!16712 tuple2!9770) (t!21922 List!15587)) )
))
(declare-datatypes ((ListLongMap!8593 0))(
  ( (ListLongMap!8594 (toList!4312 List!15587)) )
))
(declare-fun lt!369279 () ListLongMap!8593)

(declare-fun minValue!754 () V!24619)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2481 (array!45622 array!45624 (_ BitVec 32) (_ BitVec 32) V!24619 V!24619 (_ BitVec 32) Int) ListLongMap!8593)

(assert (=> b!821553 (= lt!369279 (getCurrentListMap!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821554 () Bool)

(declare-fun e!456609 () Bool)

(assert (=> b!821554 (= e!456614 (and e!456609 mapRes!23677))))

(declare-fun condMapEmpty!23677 () Bool)

(declare-fun mapDefault!23677 () ValueCell!6941)

