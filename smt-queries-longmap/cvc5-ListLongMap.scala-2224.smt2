; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36806 () Bool)

(assert start!36806)

(declare-fun b_free!7933 () Bool)

(declare-fun b_next!7933 () Bool)

(assert (=> start!36806 (= b_free!7933 (not b_next!7933))))

(declare-fun tp!28514 () Bool)

(declare-fun b_and!15175 () Bool)

(assert (=> start!36806 (= tp!28514 b_and!15175)))

(declare-fun mapNonEmpty!14436 () Bool)

(declare-fun mapRes!14436 () Bool)

(declare-fun tp!28515 () Bool)

(declare-fun e!225008 () Bool)

(assert (=> mapNonEmpty!14436 (= mapRes!14436 (and tp!28515 e!225008))))

(declare-datatypes ((V!12547 0))(
  ( (V!12548 (val!4335 Int)) )
))
(declare-datatypes ((ValueCell!3947 0))(
  ( (ValueCellFull!3947 (v!6532 V!12547)) (EmptyCell!3947) )
))
(declare-fun mapValue!14436 () ValueCell!3947)

(declare-datatypes ((array!21121 0))(
  ( (array!21122 (arr!10029 (Array (_ BitVec 32) ValueCell!3947)) (size!10381 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21121)

(declare-fun mapRest!14436 () (Array (_ BitVec 32) ValueCell!3947))

(declare-fun mapKey!14436 () (_ BitVec 32))

(assert (=> mapNonEmpty!14436 (= (arr!10029 _values!506) (store mapRest!14436 mapKey!14436 mapValue!14436))))

(declare-fun res!205947 () Bool)

(declare-fun e!225007 () Bool)

(assert (=> start!36806 (=> (not res!205947) (not e!225007))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36806 (= res!205947 (validMask!0 mask!970))))

(assert (=> start!36806 e!225007))

(assert (=> start!36806 true))

(declare-fun e!225009 () Bool)

(declare-fun array_inv!7418 (array!21121) Bool)

(assert (=> start!36806 (and (array_inv!7418 _values!506) e!225009)))

(assert (=> start!36806 tp!28514))

(declare-fun tp_is_empty!8581 () Bool)

(assert (=> start!36806 tp_is_empty!8581))

(declare-datatypes ((array!21123 0))(
  ( (array!21124 (arr!10030 (Array (_ BitVec 32) (_ BitVec 64))) (size!10382 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21123)

(declare-fun array_inv!7419 (array!21123) Bool)

(assert (=> start!36806 (array_inv!7419 _keys!658)))

(declare-fun b!367733 () Bool)

(declare-fun res!205946 () Bool)

(assert (=> b!367733 (=> (not res!205946) (not e!225007))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367733 (= res!205946 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!367734 () Bool)

(declare-fun res!205948 () Bool)

(assert (=> b!367734 (=> (not res!205948) (not e!225007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367734 (= res!205948 (validKeyInArray!0 k!778))))

(declare-fun b!367735 () Bool)

(declare-fun res!205949 () Bool)

(assert (=> b!367735 (=> (not res!205949) (not e!225007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21123 (_ BitVec 32)) Bool)

(assert (=> b!367735 (= res!205949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367736 () Bool)

(declare-fun e!225006 () Bool)

(assert (=> b!367736 (= e!225007 e!225006)))

(declare-fun res!205942 () Bool)

(assert (=> b!367736 (=> (not res!205942) (not e!225006))))

(declare-fun lt!169422 () array!21123)

(assert (=> b!367736 (= res!205942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169422 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367736 (= lt!169422 (array!21124 (store (arr!10030 _keys!658) i!548 k!778) (size!10382 _keys!658)))))

(declare-fun b!367737 () Bool)

(declare-fun e!225010 () Bool)

(assert (=> b!367737 (= e!225009 (and e!225010 mapRes!14436))))

(declare-fun condMapEmpty!14436 () Bool)

(declare-fun mapDefault!14436 () ValueCell!3947)

