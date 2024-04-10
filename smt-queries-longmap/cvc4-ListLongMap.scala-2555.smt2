; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39152 () Bool)

(assert start!39152)

(declare-fun b_free!9419 () Bool)

(declare-fun b_next!9419 () Bool)

(assert (=> start!39152 (= b_free!9419 (not b_next!9419))))

(declare-fun tp!33785 () Bool)

(declare-fun b_and!16805 () Bool)

(assert (=> start!39152 (= tp!33785 b_and!16805)))

(declare-fun b!412032 () Bool)

(declare-fun e!246648 () Bool)

(declare-fun tp_is_empty!10571 () Bool)

(assert (=> b!412032 (= e!246648 tp_is_empty!10571)))

(declare-fun b!412033 () Bool)

(declare-fun e!246647 () Bool)

(declare-fun e!246645 () Bool)

(assert (=> b!412033 (= e!246647 e!246645)))

(declare-fun res!239175 () Bool)

(assert (=> b!412033 (=> (not res!239175) (not e!246645))))

(declare-datatypes ((array!25003 0))(
  ( (array!25004 (arr!11951 (Array (_ BitVec 32) (_ BitVec 64))) (size!12303 (_ BitVec 32))) )
))
(declare-fun lt!189399 () array!25003)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25003 (_ BitVec 32)) Bool)

(assert (=> b!412033 (= res!239175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189399 mask!1025))))

(declare-fun _keys!709 () array!25003)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412033 (= lt!189399 (array!25004 (store (arr!11951 _keys!709) i!563 k!794) (size!12303 _keys!709)))))

(declare-fun b!412034 () Bool)

(assert (=> b!412034 (= e!246645 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15199 0))(
  ( (V!15200 (val!5330 Int)) )
))
(declare-fun minValue!515 () V!15199)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4942 0))(
  ( (ValueCellFull!4942 (v!7577 V!15199)) (EmptyCell!4942) )
))
(declare-datatypes ((array!25005 0))(
  ( (array!25006 (arr!11952 (Array (_ BitVec 32) ValueCell!4942)) (size!12304 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25005)

(declare-fun v!412 () V!15199)

(declare-datatypes ((tuple2!6914 0))(
  ( (tuple2!6915 (_1!3468 (_ BitVec 64)) (_2!3468 V!15199)) )
))
(declare-datatypes ((List!6939 0))(
  ( (Nil!6936) (Cons!6935 (h!7791 tuple2!6914) (t!12113 List!6939)) )
))
(declare-datatypes ((ListLongMap!5827 0))(
  ( (ListLongMap!5828 (toList!2929 List!6939)) )
))
(declare-fun lt!189400 () ListLongMap!5827)

(declare-fun zeroValue!515 () V!15199)

(declare-fun getCurrentListMapNoExtraKeys!1137 (array!25003 array!25005 (_ BitVec 32) (_ BitVec 32) V!15199 V!15199 (_ BitVec 32) Int) ListLongMap!5827)

(assert (=> b!412034 (= lt!189400 (getCurrentListMapNoExtraKeys!1137 lt!189399 (array!25006 (store (arr!11952 _values!549) i!563 (ValueCellFull!4942 v!412)) (size!12304 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189401 () ListLongMap!5827)

(assert (=> b!412034 (= lt!189401 (getCurrentListMapNoExtraKeys!1137 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412035 () Bool)

(declare-fun res!239169 () Bool)

(assert (=> b!412035 (=> (not res!239169) (not e!246647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412035 (= res!239169 (validMask!0 mask!1025))))

(declare-fun b!412037 () Bool)

(declare-fun res!239170 () Bool)

(assert (=> b!412037 (=> (not res!239170) (not e!246647))))

(assert (=> b!412037 (= res!239170 (and (= (size!12304 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12303 _keys!709) (size!12304 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412038 () Bool)

(declare-fun res!239173 () Bool)

(assert (=> b!412038 (=> (not res!239173) (not e!246647))))

(declare-datatypes ((List!6940 0))(
  ( (Nil!6937) (Cons!6936 (h!7792 (_ BitVec 64)) (t!12114 List!6940)) )
))
(declare-fun arrayNoDuplicates!0 (array!25003 (_ BitVec 32) List!6940) Bool)

(assert (=> b!412038 (= res!239173 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6937))))

(declare-fun b!412039 () Bool)

(declare-fun res!239168 () Bool)

(assert (=> b!412039 (=> (not res!239168) (not e!246647))))

(assert (=> b!412039 (= res!239168 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12303 _keys!709))))))

(declare-fun b!412040 () Bool)

(declare-fun e!246646 () Bool)

(declare-fun e!246644 () Bool)

(declare-fun mapRes!17478 () Bool)

(assert (=> b!412040 (= e!246646 (and e!246644 mapRes!17478))))

(declare-fun condMapEmpty!17478 () Bool)

(declare-fun mapDefault!17478 () ValueCell!4942)

