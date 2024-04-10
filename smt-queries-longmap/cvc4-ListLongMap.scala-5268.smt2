; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70746 () Bool)

(assert start!70746)

(declare-fun b_free!13019 () Bool)

(declare-fun b_next!13019 () Bool)

(assert (=> start!70746 (= b_free!13019 (not b_next!13019))))

(declare-fun tp!45799 () Bool)

(declare-fun b_and!21881 () Bool)

(assert (=> start!70746 (= tp!45799 b_and!21881)))

(declare-fun mapIsEmpty!23701 () Bool)

(declare-fun mapRes!23701 () Bool)

(assert (=> mapIsEmpty!23701 mapRes!23701))

(declare-fun b!821745 () Bool)

(declare-fun res!560552 () Bool)

(declare-fun e!456756 () Bool)

(assert (=> b!821745 (=> (not res!560552) (not e!456756))))

(declare-datatypes ((array!45652 0))(
  ( (array!45653 (arr!21877 (Array (_ BitVec 32) (_ BitVec 64))) (size!22298 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45652)

(declare-datatypes ((List!15598 0))(
  ( (Nil!15595) (Cons!15594 (h!16723 (_ BitVec 64)) (t!21933 List!15598)) )
))
(declare-fun arrayNoDuplicates!0 (array!45652 (_ BitVec 32) List!15598) Bool)

(assert (=> b!821745 (= res!560552 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15595))))

(declare-fun res!560551 () Bool)

(assert (=> start!70746 (=> (not res!560551) (not e!456756))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70746 (= res!560551 (validMask!0 mask!1312))))

(assert (=> start!70746 e!456756))

(declare-fun tp_is_empty!14729 () Bool)

(assert (=> start!70746 tp_is_empty!14729))

(declare-fun array_inv!17477 (array!45652) Bool)

(assert (=> start!70746 (array_inv!17477 _keys!976)))

(assert (=> start!70746 true))

(declare-datatypes ((V!24639 0))(
  ( (V!24640 (val!7412 Int)) )
))
(declare-datatypes ((ValueCell!6949 0))(
  ( (ValueCellFull!6949 (v!9843 V!24639)) (EmptyCell!6949) )
))
(declare-datatypes ((array!45654 0))(
  ( (array!45655 (arr!21878 (Array (_ BitVec 32) ValueCell!6949)) (size!22299 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45654)

(declare-fun e!456754 () Bool)

(declare-fun array_inv!17478 (array!45654) Bool)

(assert (=> start!70746 (and (array_inv!17478 _values!788) e!456754)))

(assert (=> start!70746 tp!45799))

(declare-fun b!821746 () Bool)

(declare-fun res!560549 () Bool)

(assert (=> b!821746 (=> (not res!560549) (not e!456756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45652 (_ BitVec 32)) Bool)

(assert (=> b!821746 (= res!560549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821747 () Bool)

(declare-fun e!456757 () Bool)

(assert (=> b!821747 (= e!456757 tp_is_empty!14729)))

(declare-fun b!821748 () Bool)

(declare-fun e!456753 () Bool)

(assert (=> b!821748 (= e!456756 (not e!456753))))

(declare-fun res!560548 () Bool)

(assert (=> b!821748 (=> res!560548 e!456753)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821748 (= res!560548 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9782 0))(
  ( (tuple2!9783 (_1!4902 (_ BitVec 64)) (_2!4902 V!24639)) )
))
(declare-datatypes ((List!15599 0))(
  ( (Nil!15596) (Cons!15595 (h!16724 tuple2!9782) (t!21934 List!15599)) )
))
(declare-datatypes ((ListLongMap!8605 0))(
  ( (ListLongMap!8606 (toList!4318 List!15599)) )
))
(declare-fun lt!369375 () ListLongMap!8605)

(declare-fun lt!369374 () ListLongMap!8605)

(assert (=> b!821748 (= lt!369375 lt!369374)))

(declare-fun zeroValueBefore!34 () V!24639)

(declare-datatypes ((Unit!28103 0))(
  ( (Unit!28104) )
))
(declare-fun lt!369376 () Unit!28103)

(declare-fun zeroValueAfter!34 () V!24639)

(declare-fun minValue!754 () V!24639)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!449 (array!45652 array!45654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24639 V!24639 V!24639 V!24639 (_ BitVec 32) Int) Unit!28103)

(assert (=> b!821748 (= lt!369376 (lemmaNoChangeToArrayThenSameMapNoExtras!449 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2339 (array!45652 array!45654 (_ BitVec 32) (_ BitVec 32) V!24639 V!24639 (_ BitVec 32) Int) ListLongMap!8605)

(assert (=> b!821748 (= lt!369374 (getCurrentListMapNoExtraKeys!2339 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821748 (= lt!369375 (getCurrentListMapNoExtraKeys!2339 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821749 () Bool)

(assert (=> b!821749 (= e!456754 (and e!456757 mapRes!23701))))

(declare-fun condMapEmpty!23701 () Bool)

(declare-fun mapDefault!23701 () ValueCell!6949)

