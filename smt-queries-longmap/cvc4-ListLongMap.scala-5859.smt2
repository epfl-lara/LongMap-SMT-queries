; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75688 () Bool)

(assert start!75688)

(declare-fun b!889908 () Bool)

(declare-fun b_free!15659 () Bool)

(declare-fun b_next!15659 () Bool)

(assert (=> b!889908 (= b_free!15659 (not b_next!15659))))

(declare-fun tp!54945 () Bool)

(declare-fun b_and!25899 () Bool)

(assert (=> b!889908 (= tp!54945 b_and!25899)))

(declare-fun b!889903 () Bool)

(declare-fun e!496151 () Bool)

(assert (=> b!889903 (= e!496151 false)))

(declare-fun lt!402136 () Bool)

(declare-datatypes ((array!51954 0))(
  ( (array!51955 (arr!24983 (Array (_ BitVec 32) (_ BitVec 64))) (size!25427 (_ BitVec 32))) )
))
(declare-datatypes ((V!28947 0))(
  ( (V!28948 (val!9044 Int)) )
))
(declare-datatypes ((ValueCell!8512 0))(
  ( (ValueCellFull!8512 (v!11522 V!28947)) (EmptyCell!8512) )
))
(declare-datatypes ((array!51956 0))(
  ( (array!51957 (arr!24984 (Array (_ BitVec 32) ValueCell!8512)) (size!25428 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4040 0))(
  ( (LongMapFixedSize!4041 (defaultEntry!5217 Int) (mask!25676 (_ BitVec 32)) (extraKeys!4911 (_ BitVec 32)) (zeroValue!5015 V!28947) (minValue!5015 V!28947) (_size!2075 (_ BitVec 32)) (_keys!9900 array!51954) (_values!5202 array!51956) (_vacant!2075 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4040)

(declare-datatypes ((List!17713 0))(
  ( (Nil!17710) (Cons!17709 (h!18840 (_ BitVec 64)) (t!25012 List!17713)) )
))
(declare-fun arrayNoDuplicates!0 (array!51954 (_ BitVec 32) List!17713) Bool)

(assert (=> b!889903 (= lt!402136 (arrayNoDuplicates!0 (_keys!9900 thiss!1181) #b00000000000000000000000000000000 Nil!17710))))

(declare-fun mapNonEmpty!28535 () Bool)

(declare-fun mapRes!28535 () Bool)

(declare-fun tp!54946 () Bool)

(declare-fun e!496149 () Bool)

(assert (=> mapNonEmpty!28535 (= mapRes!28535 (and tp!54946 e!496149))))

(declare-fun mapRest!28535 () (Array (_ BitVec 32) ValueCell!8512))

(declare-fun mapKey!28535 () (_ BitVec 32))

(declare-fun mapValue!28535 () ValueCell!8512)

(assert (=> mapNonEmpty!28535 (= (arr!24984 (_values!5202 thiss!1181)) (store mapRest!28535 mapKey!28535 mapValue!28535))))

(declare-fun b!889904 () Bool)

(declare-fun tp_is_empty!17987 () Bool)

(assert (=> b!889904 (= e!496149 tp_is_empty!17987)))

(declare-fun b!889905 () Bool)

(declare-fun res!603040 () Bool)

(assert (=> b!889905 (=> (not res!603040) (not e!496151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51954 (_ BitVec 32)) Bool)

(assert (=> b!889905 (= res!603040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9900 thiss!1181) (mask!25676 thiss!1181)))))

(declare-fun b!889906 () Bool)

(declare-fun e!496146 () Bool)

(assert (=> b!889906 (= e!496146 tp_is_empty!17987)))

(declare-fun b!889907 () Bool)

(declare-fun res!603042 () Bool)

(declare-fun e!496150 () Bool)

(assert (=> b!889907 (=> (not res!603042) (not e!496150))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889907 (= res!603042 (not (= key!785 (bvneg key!785))))))

(declare-fun e!496147 () Bool)

(declare-fun e!496152 () Bool)

(declare-fun array_inv!19646 (array!51954) Bool)

(declare-fun array_inv!19647 (array!51956) Bool)

(assert (=> b!889908 (= e!496147 (and tp!54945 tp_is_empty!17987 (array_inv!19646 (_keys!9900 thiss!1181)) (array_inv!19647 (_values!5202 thiss!1181)) e!496152))))

(declare-fun res!603044 () Bool)

(assert (=> start!75688 (=> (not res!603044) (not e!496150))))

(declare-fun valid!1569 (LongMapFixedSize!4040) Bool)

(assert (=> start!75688 (= res!603044 (valid!1569 thiss!1181))))

(assert (=> start!75688 e!496150))

(assert (=> start!75688 e!496147))

(assert (=> start!75688 true))

(declare-fun b!889909 () Bool)

(assert (=> b!889909 (= e!496152 (and e!496146 mapRes!28535))))

(declare-fun condMapEmpty!28535 () Bool)

(declare-fun mapDefault!28535 () ValueCell!8512)

