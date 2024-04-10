; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70724 () Bool)

(assert start!70724)

(declare-fun b_free!12997 () Bool)

(declare-fun b_next!12997 () Bool)

(assert (=> start!70724 (= b_free!12997 (not b_next!12997))))

(declare-fun tp!45733 () Bool)

(declare-fun b_and!21859 () Bool)

(assert (=> start!70724 (= tp!45733 b_and!21859)))

(declare-fun b!821481 () Bool)

(declare-fun e!456558 () Bool)

(declare-fun tp_is_empty!14707 () Bool)

(assert (=> b!821481 (= e!456558 tp_is_empty!14707)))

(declare-fun b!821482 () Bool)

(declare-fun res!560387 () Bool)

(declare-fun e!456556 () Bool)

(assert (=> b!821482 (=> (not res!560387) (not e!456556))))

(declare-datatypes ((array!45610 0))(
  ( (array!45611 (arr!21856 (Array (_ BitVec 32) (_ BitVec 64))) (size!22277 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45610)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45610 (_ BitVec 32)) Bool)

(assert (=> b!821482 (= res!560387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821483 () Bool)

(declare-fun res!560383 () Bool)

(assert (=> b!821483 (=> (not res!560383) (not e!456556))))

(declare-datatypes ((List!15582 0))(
  ( (Nil!15579) (Cons!15578 (h!16707 (_ BitVec 64)) (t!21917 List!15582)) )
))
(declare-fun arrayNoDuplicates!0 (array!45610 (_ BitVec 32) List!15582) Bool)

(assert (=> b!821483 (= res!560383 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15579))))

(declare-fun b!821484 () Bool)

(declare-fun e!456559 () Bool)

(assert (=> b!821484 (= e!456559 true)))

(declare-datatypes ((V!24611 0))(
  ( (V!24612 (val!7401 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24611)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24611)

(declare-datatypes ((ValueCell!6938 0))(
  ( (ValueCellFull!6938 (v!9832 V!24611)) (EmptyCell!6938) )
))
(declare-datatypes ((array!45612 0))(
  ( (array!45613 (arr!21857 (Array (_ BitVec 32) ValueCell!6938)) (size!22278 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45612)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9764 0))(
  ( (tuple2!9765 (_1!4893 (_ BitVec 64)) (_2!4893 V!24611)) )
))
(declare-datatypes ((List!15583 0))(
  ( (Nil!15580) (Cons!15579 (h!16708 tuple2!9764) (t!21918 List!15583)) )
))
(declare-datatypes ((ListLongMap!8587 0))(
  ( (ListLongMap!8588 (toList!4309 List!15583)) )
))
(declare-fun lt!369245 () ListLongMap!8587)

(declare-fun getCurrentListMap!2478 (array!45610 array!45612 (_ BitVec 32) (_ BitVec 32) V!24611 V!24611 (_ BitVec 32) Int) ListLongMap!8587)

(assert (=> b!821484 (= lt!369245 (getCurrentListMap!2478 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23668 () Bool)

(declare-fun mapRes!23668 () Bool)

(assert (=> mapIsEmpty!23668 mapRes!23668))

(declare-fun b!821485 () Bool)

(declare-fun e!456560 () Bool)

(assert (=> b!821485 (= e!456560 (and e!456558 mapRes!23668))))

(declare-fun condMapEmpty!23668 () Bool)

(declare-fun mapDefault!23668 () ValueCell!6938)

