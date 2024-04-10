; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40476 () Bool)

(assert start!40476)

(declare-fun b_free!10547 () Bool)

(declare-fun b_next!10547 () Bool)

(assert (=> start!40476 (= b_free!10547 (not b_next!10547))))

(declare-fun tp!37418 () Bool)

(declare-fun b_and!18531 () Bool)

(assert (=> start!40476 (= tp!37418 b_and!18531)))

(declare-fun b!445705 () Bool)

(declare-fun res!264503 () Bool)

(declare-fun e!261942 () Bool)

(assert (=> b!445705 (=> (not res!264503) (not e!261942))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27529 0))(
  ( (array!27530 (arr!13212 (Array (_ BitVec 32) (_ BitVec 64))) (size!13564 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27529)

(assert (=> b!445705 (= res!264503 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13564 _keys!709))))))

(declare-fun b!445706 () Bool)

(declare-fun res!264495 () Bool)

(assert (=> b!445706 (=> (not res!264495) (not e!261942))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27529 (_ BitVec 32)) Bool)

(assert (=> b!445706 (= res!264495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445707 () Bool)

(declare-fun res!264499 () Bool)

(assert (=> b!445707 (=> (not res!264499) (not e!261942))))

(declare-datatypes ((List!7899 0))(
  ( (Nil!7896) (Cons!7895 (h!8751 (_ BitVec 64)) (t!13657 List!7899)) )
))
(declare-fun arrayNoDuplicates!0 (array!27529 (_ BitVec 32) List!7899) Bool)

(assert (=> b!445707 (= res!264499 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7896))))

(declare-fun e!261940 () Bool)

(declare-datatypes ((V!16919 0))(
  ( (V!16920 (val!5975 Int)) )
))
(declare-datatypes ((tuple2!7848 0))(
  ( (tuple2!7849 (_1!3935 (_ BitVec 64)) (_2!3935 V!16919)) )
))
(declare-datatypes ((List!7900 0))(
  ( (Nil!7897) (Cons!7896 (h!8752 tuple2!7848) (t!13658 List!7900)) )
))
(declare-datatypes ((ListLongMap!6761 0))(
  ( (ListLongMap!6762 (toList!3396 List!7900)) )
))
(declare-fun call!29597 () ListLongMap!6761)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16919)

(declare-fun b!445709 () Bool)

(declare-fun call!29598 () ListLongMap!6761)

(declare-fun +!1527 (ListLongMap!6761 tuple2!7848) ListLongMap!6761)

(assert (=> b!445709 (= e!261940 (= call!29598 (+!1527 call!29597 (tuple2!7849 k!794 v!412))))))

(declare-fun b!445710 () Bool)

(declare-fun res!264502 () Bool)

(assert (=> b!445710 (=> (not res!264502) (not e!261942))))

(assert (=> b!445710 (= res!264502 (or (= (select (arr!13212 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13212 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445711 () Bool)

(declare-fun res!264498 () Bool)

(assert (=> b!445711 (=> (not res!264498) (not e!261942))))

(declare-fun arrayContainsKey!0 (array!27529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445711 (= res!264498 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!445712 () Bool)

(declare-fun e!261941 () Bool)

(declare-fun tp_is_empty!11861 () Bool)

(assert (=> b!445712 (= e!261941 tp_is_empty!11861)))

(declare-fun b!445713 () Bool)

(declare-fun e!261944 () Bool)

(assert (=> b!445713 (= e!261942 e!261944)))

(declare-fun res!264494 () Bool)

(assert (=> b!445713 (=> (not res!264494) (not e!261944))))

(declare-fun lt!203666 () array!27529)

(assert (=> b!445713 (= res!264494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203666 mask!1025))))

(assert (=> b!445713 (= lt!203666 (array!27530 (store (arr!13212 _keys!709) i!563 k!794) (size!13564 _keys!709)))))

(declare-fun b!445714 () Bool)

(declare-fun e!261943 () Bool)

(assert (=> b!445714 (= e!261943 tp_is_empty!11861)))

(declare-fun b!445715 () Bool)

(declare-fun e!261939 () Bool)

(declare-fun mapRes!19419 () Bool)

(assert (=> b!445715 (= e!261939 (and e!261941 mapRes!19419))))

(declare-fun condMapEmpty!19419 () Bool)

(declare-datatypes ((ValueCell!5587 0))(
  ( (ValueCellFull!5587 (v!8226 V!16919)) (EmptyCell!5587) )
))
(declare-datatypes ((array!27531 0))(
  ( (array!27532 (arr!13213 (Array (_ BitVec 32) ValueCell!5587)) (size!13565 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27531)

(declare-fun mapDefault!19419 () ValueCell!5587)

