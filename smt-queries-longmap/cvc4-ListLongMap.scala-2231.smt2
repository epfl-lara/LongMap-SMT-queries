; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36852 () Bool)

(assert start!36852)

(declare-fun b_free!7979 () Bool)

(declare-fun b_next!7979 () Bool)

(assert (=> start!36852 (= b_free!7979 (not b_next!7979))))

(declare-fun tp!28652 () Bool)

(declare-fun b_and!15221 () Bool)

(assert (=> start!36852 (= tp!28652 b_and!15221)))

(declare-fun b!368630 () Bool)

(declare-fun e!225421 () Bool)

(declare-fun e!225423 () Bool)

(assert (=> b!368630 (= e!225421 e!225423)))

(declare-fun res!206634 () Bool)

(assert (=> b!368630 (=> (not res!206634) (not e!225423))))

(declare-datatypes ((array!21209 0))(
  ( (array!21210 (arr!10073 (Array (_ BitVec 32) (_ BitVec 64))) (size!10425 (_ BitVec 32))) )
))
(declare-fun lt!169560 () array!21209)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21209 (_ BitVec 32)) Bool)

(assert (=> b!368630 (= res!206634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169560 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21209)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368630 (= lt!169560 (array!21210 (store (arr!10073 _keys!658) i!548 k!778) (size!10425 _keys!658)))))

(declare-fun b!368631 () Bool)

(assert (=> b!368631 (= e!225423 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12607 0))(
  ( (V!12608 (val!4358 Int)) )
))
(declare-datatypes ((ValueCell!3970 0))(
  ( (ValueCellFull!3970 (v!6555 V!12607)) (EmptyCell!3970) )
))
(declare-datatypes ((array!21211 0))(
  ( (array!21212 (arr!10074 (Array (_ BitVec 32) ValueCell!3970)) (size!10426 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21211)

(declare-datatypes ((tuple2!5776 0))(
  ( (tuple2!5777 (_1!2899 (_ BitVec 64)) (_2!2899 V!12607)) )
))
(declare-datatypes ((List!5609 0))(
  ( (Nil!5606) (Cons!5605 (h!6461 tuple2!5776) (t!10759 List!5609)) )
))
(declare-datatypes ((ListLongMap!4689 0))(
  ( (ListLongMap!4690 (toList!2360 List!5609)) )
))
(declare-fun lt!169559 () ListLongMap!4689)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12607)

(declare-fun minValue!472 () V!12607)

(declare-fun getCurrentListMapNoExtraKeys!637 (array!21209 array!21211 (_ BitVec 32) (_ BitVec 32) V!12607 V!12607 (_ BitVec 32) Int) ListLongMap!4689)

(assert (=> b!368631 (= lt!169559 (getCurrentListMapNoExtraKeys!637 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368632 () Bool)

(declare-fun res!206637 () Bool)

(assert (=> b!368632 (=> (not res!206637) (not e!225421))))

(declare-datatypes ((List!5610 0))(
  ( (Nil!5607) (Cons!5606 (h!6462 (_ BitVec 64)) (t!10760 List!5610)) )
))
(declare-fun arrayNoDuplicates!0 (array!21209 (_ BitVec 32) List!5610) Bool)

(assert (=> b!368632 (= res!206637 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5607))))

(declare-fun b!368633 () Bool)

(declare-fun res!206631 () Bool)

(assert (=> b!368633 (=> (not res!206631) (not e!225421))))

(assert (=> b!368633 (= res!206631 (or (= (select (arr!10073 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10073 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368634 () Bool)

(declare-fun e!225424 () Bool)

(declare-fun tp_is_empty!8627 () Bool)

(assert (=> b!368634 (= e!225424 tp_is_empty!8627)))

(declare-fun b!368635 () Bool)

(declare-fun res!206639 () Bool)

(assert (=> b!368635 (=> (not res!206639) (not e!225421))))

(assert (=> b!368635 (= res!206639 (and (= (size!10426 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10425 _keys!658) (size!10426 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368636 () Bool)

(declare-fun e!225420 () Bool)

(declare-fun mapRes!14505 () Bool)

(assert (=> b!368636 (= e!225420 (and e!225424 mapRes!14505))))

(declare-fun condMapEmpty!14505 () Bool)

(declare-fun mapDefault!14505 () ValueCell!3970)

