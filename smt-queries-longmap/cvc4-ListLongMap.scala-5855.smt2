; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75664 () Bool)

(assert start!75664)

(declare-fun b!889582 () Bool)

(declare-fun b_free!15635 () Bool)

(declare-fun b_next!15635 () Bool)

(assert (=> b!889582 (= b_free!15635 (not b_next!15635))))

(declare-fun tp!54874 () Bool)

(declare-fun b_and!25875 () Bool)

(assert (=> b!889582 (= tp!54874 b_and!25875)))

(declare-fun b!889579 () Bool)

(declare-fun res!602864 () Bool)

(declare-fun e!495895 () Bool)

(assert (=> b!889579 (=> (not res!602864) (not e!495895))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889579 (= res!602864 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889580 () Bool)

(declare-fun res!602861 () Bool)

(declare-fun e!495898 () Bool)

(assert (=> b!889580 (=> (not res!602861) (not e!495898))))

(declare-datatypes ((array!51906 0))(
  ( (array!51907 (arr!24959 (Array (_ BitVec 32) (_ BitVec 64))) (size!25403 (_ BitVec 32))) )
))
(declare-datatypes ((V!28915 0))(
  ( (V!28916 (val!9032 Int)) )
))
(declare-datatypes ((ValueCell!8500 0))(
  ( (ValueCellFull!8500 (v!11510 V!28915)) (EmptyCell!8500) )
))
(declare-datatypes ((array!51908 0))(
  ( (array!51909 (arr!24960 (Array (_ BitVec 32) ValueCell!8500)) (size!25404 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4016 0))(
  ( (LongMapFixedSize!4017 (defaultEntry!5205 Int) (mask!25656 (_ BitVec 32)) (extraKeys!4899 (_ BitVec 32)) (zeroValue!5003 V!28915) (minValue!5003 V!28915) (_size!2063 (_ BitVec 32)) (_keys!9888 array!51906) (_values!5190 array!51908) (_vacant!2063 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4016)

(assert (=> b!889580 (= res!602861 (and (= (size!25404 (_values!5190 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25656 thiss!1181))) (= (size!25403 (_keys!9888 thiss!1181)) (size!25404 (_values!5190 thiss!1181))) (bvsge (mask!25656 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4899 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4899 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889581 () Bool)

(assert (=> b!889581 (= e!495898 false)))

(declare-fun lt!402063 () Bool)

(declare-datatypes ((List!17705 0))(
  ( (Nil!17702) (Cons!17701 (h!18832 (_ BitVec 64)) (t!25004 List!17705)) )
))
(declare-fun arrayNoDuplicates!0 (array!51906 (_ BitVec 32) List!17705) Bool)

(assert (=> b!889581 (= lt!402063 (arrayNoDuplicates!0 (_keys!9888 thiss!1181) #b00000000000000000000000000000000 Nil!17702))))

(declare-fun e!495896 () Bool)

(declare-fun tp_is_empty!17963 () Bool)

(declare-fun e!495897 () Bool)

(declare-fun array_inv!19634 (array!51906) Bool)

(declare-fun array_inv!19635 (array!51908) Bool)

(assert (=> b!889582 (= e!495897 (and tp!54874 tp_is_empty!17963 (array_inv!19634 (_keys!9888 thiss!1181)) (array_inv!19635 (_values!5190 thiss!1181)) e!495896))))

(declare-fun b!889583 () Bool)

(declare-fun e!495894 () Bool)

(declare-fun mapRes!28499 () Bool)

(assert (=> b!889583 (= e!495896 (and e!495894 mapRes!28499))))

(declare-fun condMapEmpty!28499 () Bool)

(declare-fun mapDefault!28499 () ValueCell!8500)

