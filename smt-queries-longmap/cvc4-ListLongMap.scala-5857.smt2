; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75676 () Bool)

(assert start!75676)

(declare-fun b!889744 () Bool)

(declare-fun b_free!15647 () Bool)

(declare-fun b_next!15647 () Bool)

(assert (=> b!889744 (= b_free!15647 (not b_next!15647))))

(declare-fun tp!54909 () Bool)

(declare-fun b_and!25887 () Bool)

(assert (=> b!889744 (= tp!54909 b_and!25887)))

(declare-fun b!889741 () Bool)

(declare-fun res!602952 () Bool)

(declare-fun e!496020 () Bool)

(assert (=> b!889741 (=> (not res!602952) (not e!496020))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889741 (= res!602952 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889742 () Bool)

(declare-fun e!496026 () Bool)

(declare-fun tp_is_empty!17975 () Bool)

(assert (=> b!889742 (= e!496026 tp_is_empty!17975)))

(declare-fun b!889743 () Bool)

(declare-fun e!496024 () Bool)

(assert (=> b!889743 (= e!496024 tp_is_empty!17975)))

(declare-fun e!496025 () Bool)

(declare-datatypes ((array!51930 0))(
  ( (array!51931 (arr!24971 (Array (_ BitVec 32) (_ BitVec 64))) (size!25415 (_ BitVec 32))) )
))
(declare-datatypes ((V!28931 0))(
  ( (V!28932 (val!9038 Int)) )
))
(declare-datatypes ((ValueCell!8506 0))(
  ( (ValueCellFull!8506 (v!11516 V!28931)) (EmptyCell!8506) )
))
(declare-datatypes ((array!51932 0))(
  ( (array!51933 (arr!24972 (Array (_ BitVec 32) ValueCell!8506)) (size!25416 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4028 0))(
  ( (LongMapFixedSize!4029 (defaultEntry!5211 Int) (mask!25666 (_ BitVec 32)) (extraKeys!4905 (_ BitVec 32)) (zeroValue!5009 V!28931) (minValue!5009 V!28931) (_size!2069 (_ BitVec 32)) (_keys!9894 array!51930) (_values!5196 array!51932) (_vacant!2069 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4028)

(declare-fun e!496023 () Bool)

(declare-fun array_inv!19640 (array!51930) Bool)

(declare-fun array_inv!19641 (array!51932) Bool)

(assert (=> b!889744 (= e!496023 (and tp!54909 tp_is_empty!17975 (array_inv!19640 (_keys!9894 thiss!1181)) (array_inv!19641 (_values!5196 thiss!1181)) e!496025))))

(declare-fun res!602953 () Bool)

(assert (=> start!75676 (=> (not res!602953) (not e!496020))))

(declare-fun valid!1565 (LongMapFixedSize!4028) Bool)

(assert (=> start!75676 (= res!602953 (valid!1565 thiss!1181))))

(assert (=> start!75676 e!496020))

(assert (=> start!75676 e!496023))

(assert (=> start!75676 true))

(declare-fun b!889745 () Bool)

(declare-fun e!496022 () Bool)

(assert (=> b!889745 (= e!496020 e!496022)))

(declare-fun res!602950 () Bool)

(assert (=> b!889745 (=> (not res!602950) (not e!496022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889745 (= res!602950 (validMask!0 (mask!25666 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8781 0))(
  ( (MissingZero!8781 (index!37495 (_ BitVec 32))) (Found!8781 (index!37496 (_ BitVec 32))) (Intermediate!8781 (undefined!9593 Bool) (index!37497 (_ BitVec 32)) (x!75549 (_ BitVec 32))) (Undefined!8781) (MissingVacant!8781 (index!37498 (_ BitVec 32))) )
))
(declare-fun lt!402100 () SeekEntryResult!8781)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51930 (_ BitVec 32)) SeekEntryResult!8781)

(assert (=> b!889745 (= lt!402100 (seekEntry!0 key!785 (_keys!9894 thiss!1181) (mask!25666 thiss!1181)))))

(declare-fun mapNonEmpty!28517 () Bool)

(declare-fun mapRes!28517 () Bool)

(declare-fun tp!54910 () Bool)

(assert (=> mapNonEmpty!28517 (= mapRes!28517 (and tp!54910 e!496026))))

(declare-fun mapValue!28517 () ValueCell!8506)

(declare-fun mapRest!28517 () (Array (_ BitVec 32) ValueCell!8506))

(declare-fun mapKey!28517 () (_ BitVec 32))

(assert (=> mapNonEmpty!28517 (= (arr!24972 (_values!5196 thiss!1181)) (store mapRest!28517 mapKey!28517 mapValue!28517))))

(declare-fun b!889746 () Bool)

(declare-fun res!602954 () Bool)

(assert (=> b!889746 (=> (not res!602954) (not e!496022))))

(assert (=> b!889746 (= res!602954 (and (= (size!25416 (_values!5196 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25666 thiss!1181))) (= (size!25415 (_keys!9894 thiss!1181)) (size!25416 (_values!5196 thiss!1181))) (bvsge (mask!25666 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4905 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4905 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889747 () Bool)

(declare-fun res!602951 () Bool)

(assert (=> b!889747 (=> (not res!602951) (not e!496022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51930 (_ BitVec 32)) Bool)

(assert (=> b!889747 (= res!602951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9894 thiss!1181) (mask!25666 thiss!1181)))))

(declare-fun b!889748 () Bool)

(assert (=> b!889748 (= e!496022 false)))

(declare-fun lt!402099 () Bool)

(declare-datatypes ((List!17709 0))(
  ( (Nil!17706) (Cons!17705 (h!18836 (_ BitVec 64)) (t!25008 List!17709)) )
))
(declare-fun arrayNoDuplicates!0 (array!51930 (_ BitVec 32) List!17709) Bool)

(assert (=> b!889748 (= lt!402099 (arrayNoDuplicates!0 (_keys!9894 thiss!1181) #b00000000000000000000000000000000 Nil!17706))))

(declare-fun mapIsEmpty!28517 () Bool)

(assert (=> mapIsEmpty!28517 mapRes!28517))

(declare-fun b!889749 () Bool)

(assert (=> b!889749 (= e!496025 (and e!496024 mapRes!28517))))

(declare-fun condMapEmpty!28517 () Bool)

(declare-fun mapDefault!28517 () ValueCell!8506)

