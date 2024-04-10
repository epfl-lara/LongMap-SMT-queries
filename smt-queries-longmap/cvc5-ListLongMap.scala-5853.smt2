; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75648 () Bool)

(assert start!75648)

(declare-fun b!889370 () Bool)

(declare-fun b_free!15619 () Bool)

(declare-fun b_next!15619 () Bool)

(assert (=> b!889370 (= b_free!15619 (not b_next!15619))))

(declare-fun tp!54826 () Bool)

(declare-fun b_and!25859 () Bool)

(assert (=> b!889370 (= tp!54826 b_and!25859)))

(declare-fun b!889363 () Bool)

(declare-fun res!602741 () Bool)

(declare-fun e!495726 () Bool)

(assert (=> b!889363 (=> (not res!602741) (not e!495726))))

(declare-datatypes ((array!51874 0))(
  ( (array!51875 (arr!24943 (Array (_ BitVec 32) (_ BitVec 64))) (size!25387 (_ BitVec 32))) )
))
(declare-datatypes ((V!28895 0))(
  ( (V!28896 (val!9024 Int)) )
))
(declare-datatypes ((ValueCell!8492 0))(
  ( (ValueCellFull!8492 (v!11502 V!28895)) (EmptyCell!8492) )
))
(declare-datatypes ((array!51876 0))(
  ( (array!51877 (arr!24944 (Array (_ BitVec 32) ValueCell!8492)) (size!25388 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4000 0))(
  ( (LongMapFixedSize!4001 (defaultEntry!5197 Int) (mask!25644 (_ BitVec 32)) (extraKeys!4891 (_ BitVec 32)) (zeroValue!4995 V!28895) (minValue!4995 V!28895) (_size!2055 (_ BitVec 32)) (_keys!9880 array!51874) (_values!5182 array!51876) (_vacant!2055 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4000)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51874 (_ BitVec 32)) Bool)

(assert (=> b!889363 (= res!602741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9880 thiss!1181) (mask!25644 thiss!1181)))))

(declare-fun b!889364 () Bool)

(declare-fun e!495732 () Bool)

(declare-fun e!495727 () Bool)

(declare-fun mapRes!28475 () Bool)

(assert (=> b!889364 (= e!495732 (and e!495727 mapRes!28475))))

(declare-fun condMapEmpty!28475 () Bool)

(declare-fun mapDefault!28475 () ValueCell!8492)

