; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39248 () Bool)

(assert start!39248)

(declare-fun b_free!9515 () Bool)

(declare-fun b_next!9515 () Bool)

(assert (=> start!39248 (= b_free!9515 (not b_next!9515))))

(declare-fun tp!34074 () Bool)

(declare-fun b_and!16905 () Bool)

(assert (=> start!39248 (= tp!34074 b_and!16905)))

(declare-fun b!414480 () Bool)

(declare-fun e!247709 () Bool)

(declare-fun tp_is_empty!10667 () Bool)

(assert (=> b!414480 (= e!247709 tp_is_empty!10667)))

(declare-fun b!414481 () Bool)

(declare-fun res!241010 () Bool)

(declare-fun e!247703 () Bool)

(assert (=> b!414481 (=> (not res!241010) (not e!247703))))

(declare-datatypes ((array!25191 0))(
  ( (array!25192 (arr!12045 (Array (_ BitVec 32) (_ BitVec 64))) (size!12397 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25191)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15327 0))(
  ( (V!15328 (val!5378 Int)) )
))
(declare-datatypes ((ValueCell!4990 0))(
  ( (ValueCellFull!4990 (v!7625 V!15327)) (EmptyCell!4990) )
))
(declare-datatypes ((array!25193 0))(
  ( (array!25194 (arr!12046 (Array (_ BitVec 32) ValueCell!4990)) (size!12398 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25193)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!414481 (= res!241010 (and (= (size!12398 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12397 _keys!709) (size!12398 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414482 () Bool)

(declare-fun e!247702 () Bool)

(assert (=> b!414482 (= e!247703 e!247702)))

(declare-fun res!241000 () Bool)

(assert (=> b!414482 (=> (not res!241000) (not e!247702))))

(declare-fun lt!190011 () array!25191)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25191 (_ BitVec 32)) Bool)

(assert (=> b!414482 (= res!241000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190011 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414482 (= lt!190011 (array!25192 (store (arr!12045 _keys!709) i!563 k!794) (size!12397 _keys!709)))))

(declare-fun mapIsEmpty!17622 () Bool)

(declare-fun mapRes!17622 () Bool)

(assert (=> mapIsEmpty!17622 mapRes!17622))

(declare-fun b!414483 () Bool)

(declare-fun res!241011 () Bool)

(assert (=> b!414483 (=> (not res!241011) (not e!247703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414483 (= res!241011 (validMask!0 mask!1025))))

(declare-datatypes ((tuple2!6996 0))(
  ( (tuple2!6997 (_1!3509 (_ BitVec 64)) (_2!3509 V!15327)) )
))
(declare-datatypes ((List!7018 0))(
  ( (Nil!7015) (Cons!7014 (h!7870 tuple2!6996) (t!12198 List!7018)) )
))
(declare-datatypes ((ListLongMap!5909 0))(
  ( (ListLongMap!5910 (toList!2970 List!7018)) )
))
(declare-fun call!28724 () ListLongMap!5909)

(declare-fun minValue!515 () V!15327)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15327)

(declare-fun bm!28720 () Bool)

(declare-fun lt!190009 () array!25193)

(declare-fun c!54986 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1176 (array!25191 array!25193 (_ BitVec 32) (_ BitVec 32) V!15327 V!15327 (_ BitVec 32) Int) ListLongMap!5909)

(assert (=> bm!28720 (= call!28724 (getCurrentListMapNoExtraKeys!1176 (ite c!54986 lt!190011 _keys!709) (ite c!54986 lt!190009 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!241003 () Bool)

(assert (=> start!39248 (=> (not res!241003) (not e!247703))))

(assert (=> start!39248 (= res!241003 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12397 _keys!709))))))

(assert (=> start!39248 e!247703))

(assert (=> start!39248 tp_is_empty!10667))

(assert (=> start!39248 tp!34074))

(assert (=> start!39248 true))

(declare-fun e!247704 () Bool)

(declare-fun array_inv!8784 (array!25193) Bool)

(assert (=> start!39248 (and (array_inv!8784 _values!549) e!247704)))

(declare-fun array_inv!8785 (array!25191) Bool)

(assert (=> start!39248 (array_inv!8785 _keys!709)))

(declare-fun b!414484 () Bool)

(declare-fun res!240999 () Bool)

(assert (=> b!414484 (=> (not res!240999) (not e!247703))))

(assert (=> b!414484 (= res!240999 (or (= (select (arr!12045 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12045 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!28723 () ListLongMap!5909)

(declare-fun e!247705 () Bool)

(declare-fun b!414485 () Bool)

(declare-fun v!412 () V!15327)

(declare-fun +!1176 (ListLongMap!5909 tuple2!6996) ListLongMap!5909)

(assert (=> b!414485 (= e!247705 (= call!28724 (+!1176 call!28723 (tuple2!6997 k!794 v!412))))))

(declare-fun b!414486 () Bool)

(declare-fun e!247707 () Bool)

(assert (=> b!414486 (= e!247702 e!247707)))

(declare-fun res!241004 () Bool)

(assert (=> b!414486 (=> (not res!241004) (not e!247707))))

(assert (=> b!414486 (= res!241004 (= from!863 i!563))))

(declare-fun lt!190010 () ListLongMap!5909)

(assert (=> b!414486 (= lt!190010 (getCurrentListMapNoExtraKeys!1176 lt!190011 lt!190009 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414486 (= lt!190009 (array!25194 (store (arr!12046 _values!549) i!563 (ValueCellFull!4990 v!412)) (size!12398 _values!549)))))

(declare-fun lt!190012 () ListLongMap!5909)

(assert (=> b!414486 (= lt!190012 (getCurrentListMapNoExtraKeys!1176 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414487 () Bool)

(declare-fun res!241006 () Bool)

(assert (=> b!414487 (=> (not res!241006) (not e!247703))))

(declare-datatypes ((List!7019 0))(
  ( (Nil!7016) (Cons!7015 (h!7871 (_ BitVec 64)) (t!12199 List!7019)) )
))
(declare-fun arrayNoDuplicates!0 (array!25191 (_ BitVec 32) List!7019) Bool)

(assert (=> b!414487 (= res!241006 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7016))))

(declare-fun b!414488 () Bool)

(assert (=> b!414488 (= e!247704 (and e!247709 mapRes!17622))))

(declare-fun condMapEmpty!17622 () Bool)

(declare-fun mapDefault!17622 () ValueCell!4990)

