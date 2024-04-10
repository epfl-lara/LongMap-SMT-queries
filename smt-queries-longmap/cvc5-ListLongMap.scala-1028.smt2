; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21850 () Bool)

(assert start!21850)

(declare-fun b!220259 () Bool)

(declare-fun b_free!5917 () Bool)

(declare-fun b_next!5917 () Bool)

(assert (=> b!220259 (= b_free!5917 (not b_next!5917))))

(declare-fun tp!20892 () Bool)

(declare-fun b_and!12815 () Bool)

(assert (=> b!220259 (= tp!20892 b_and!12815)))

(declare-fun b!220258 () Bool)

(declare-fun e!143230 () Bool)

(declare-fun tp_is_empty!5779 () Bool)

(assert (=> b!220258 (= e!143230 tp_is_empty!5779)))

(declare-fun mapIsEmpty!9838 () Bool)

(declare-fun mapRes!9838 () Bool)

(assert (=> mapIsEmpty!9838 mapRes!9838))

(declare-datatypes ((V!7353 0))(
  ( (V!7354 (val!2934 Int)) )
))
(declare-datatypes ((ValueCell!2546 0))(
  ( (ValueCellFull!2546 (v!4954 V!7353)) (EmptyCell!2546) )
))
(declare-datatypes ((array!10801 0))(
  ( (array!10802 (arr!5120 (Array (_ BitVec 32) ValueCell!2546)) (size!5453 (_ BitVec 32))) )
))
(declare-datatypes ((array!10803 0))(
  ( (array!10804 (arr!5121 (Array (_ BitVec 32) (_ BitVec 64))) (size!5454 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2992 0))(
  ( (LongMapFixedSize!2993 (defaultEntry!4155 Int) (mask!9955 (_ BitVec 32)) (extraKeys!3892 (_ BitVec 32)) (zeroValue!3996 V!7353) (minValue!3996 V!7353) (_size!1545 (_ BitVec 32)) (_keys!6209 array!10803) (_values!4138 array!10801) (_vacant!1545 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2992)

(declare-fun e!143227 () Bool)

(declare-fun e!143226 () Bool)

(declare-fun array_inv!3389 (array!10803) Bool)

(declare-fun array_inv!3390 (array!10801) Bool)

(assert (=> b!220259 (= e!143226 (and tp!20892 tp_is_empty!5779 (array_inv!3389 (_keys!6209 thiss!1504)) (array_inv!3390 (_values!4138 thiss!1504)) e!143227))))

(declare-fun b!220260 () Bool)

(declare-fun c!36659 () Bool)

(declare-datatypes ((SeekEntryResult!809 0))(
  ( (MissingZero!809 (index!5406 (_ BitVec 32))) (Found!809 (index!5407 (_ BitVec 32))) (Intermediate!809 (undefined!1621 Bool) (index!5408 (_ BitVec 32)) (x!22949 (_ BitVec 32))) (Undefined!809) (MissingVacant!809 (index!5409 (_ BitVec 32))) )
))
(declare-fun lt!112139 () SeekEntryResult!809)

(assert (=> b!220260 (= c!36659 (is-MissingVacant!809 lt!112139))))

(declare-fun e!143221 () Bool)

(declare-fun e!143228 () Bool)

(assert (=> b!220260 (= e!143221 e!143228)))

(declare-fun b!220261 () Bool)

(declare-fun e!143231 () Bool)

(declare-fun e!143219 () Bool)

(assert (=> b!220261 (= e!143231 e!143219)))

(declare-fun res!107998 () Bool)

(assert (=> b!220261 (=> (not res!107998) (not e!143219))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220261 (= res!107998 (or (= lt!112139 (MissingZero!809 index!297)) (= lt!112139 (MissingVacant!809 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10803 (_ BitVec 32)) SeekEntryResult!809)

(assert (=> b!220261 (= lt!112139 (seekEntryOrOpen!0 key!932 (_keys!6209 thiss!1504) (mask!9955 thiss!1504)))))

(declare-fun res!107994 () Bool)

(assert (=> start!21850 (=> (not res!107994) (not e!143231))))

(declare-fun valid!1208 (LongMapFixedSize!2992) Bool)

(assert (=> start!21850 (= res!107994 (valid!1208 thiss!1504))))

(assert (=> start!21850 e!143231))

(assert (=> start!21850 e!143226))

(assert (=> start!21850 true))

(declare-fun b!220262 () Bool)

(declare-fun res!107993 () Bool)

(declare-fun e!143229 () Bool)

(assert (=> b!220262 (=> (not res!107993) (not e!143229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220262 (= res!107993 (validMask!0 (mask!9955 thiss!1504)))))

(declare-fun b!220263 () Bool)

(declare-datatypes ((Unit!6569 0))(
  ( (Unit!6570) )
))
(declare-fun e!143223 () Unit!6569)

(declare-fun lt!112142 () Unit!6569)

(assert (=> b!220263 (= e!143223 lt!112142)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!214 (array!10803 array!10801 (_ BitVec 32) (_ BitVec 32) V!7353 V!7353 (_ BitVec 64) Int) Unit!6569)

(assert (=> b!220263 (= lt!112142 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!214 (_keys!6209 thiss!1504) (_values!4138 thiss!1504) (mask!9955 thiss!1504) (extraKeys!3892 thiss!1504) (zeroValue!3996 thiss!1504) (minValue!3996 thiss!1504) key!932 (defaultEntry!4155 thiss!1504)))))

(declare-fun c!36658 () Bool)

(assert (=> b!220263 (= c!36658 (is-MissingZero!809 lt!112139))))

(assert (=> b!220263 e!143221))

(declare-fun b!220264 () Bool)

(declare-fun res!107991 () Bool)

(assert (=> b!220264 (=> (not res!107991) (not e!143229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10803 (_ BitVec 32)) Bool)

(assert (=> b!220264 (= res!107991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6209 thiss!1504) (mask!9955 thiss!1504)))))

(declare-fun b!220265 () Bool)

(declare-fun res!107990 () Bool)

(declare-fun e!143225 () Bool)

(assert (=> b!220265 (=> (not res!107990) (not e!143225))))

(assert (=> b!220265 (= res!107990 (= (select (arr!5121 (_keys!6209 thiss!1504)) (index!5406 lt!112139)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220266 () Bool)

(assert (=> b!220266 (= e!143228 (is-Undefined!809 lt!112139))))

(declare-fun b!220267 () Bool)

(declare-fun res!107995 () Bool)

(assert (=> b!220267 (=> (not res!107995) (not e!143229))))

(assert (=> b!220267 (= res!107995 (and (= (size!5453 (_values!4138 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9955 thiss!1504))) (= (size!5454 (_keys!6209 thiss!1504)) (size!5453 (_values!4138 thiss!1504))) (bvsge (mask!9955 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3892 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3892 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220268 () Bool)

(declare-fun res!107997 () Bool)

(assert (=> b!220268 (=> (not res!107997) (not e!143225))))

(declare-fun call!20585 () Bool)

(assert (=> b!220268 (= res!107997 call!20585)))

(assert (=> b!220268 (= e!143221 e!143225)))

(declare-fun b!220269 () Bool)

(declare-fun res!108001 () Bool)

(assert (=> b!220269 (=> (not res!108001) (not e!143229))))

(declare-fun arrayContainsKey!0 (array!10803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220269 (= res!108001 (arrayContainsKey!0 (_keys!6209 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20582 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20582 (= call!20585 (inRange!0 (ite c!36658 (index!5406 lt!112139) (index!5409 lt!112139)) (mask!9955 thiss!1504)))))

(declare-fun b!220270 () Bool)

(declare-fun e!143224 () Bool)

(assert (=> b!220270 (= e!143227 (and e!143224 mapRes!9838))))

(declare-fun condMapEmpty!9838 () Bool)

(declare-fun mapDefault!9838 () ValueCell!2546)

