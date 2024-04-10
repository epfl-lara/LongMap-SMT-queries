; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15590 () Bool)

(assert start!15590)

(declare-fun b!155199 () Bool)

(declare-fun b_free!3257 () Bool)

(declare-fun b_next!3257 () Bool)

(assert (=> b!155199 (= b_free!3257 (not b_next!3257))))

(declare-fun tp!12296 () Bool)

(declare-fun b_and!9671 () Bool)

(assert (=> b!155199 (= tp!12296 b_and!9671)))

(declare-fun b!155193 () Bool)

(declare-fun e!101388 () Bool)

(assert (=> b!155193 (= e!101388 false)))

(declare-fun lt!81337 () Bool)

(declare-datatypes ((V!3725 0))(
  ( (V!3726 (val!1574 Int)) )
))
(declare-datatypes ((ValueCell!1186 0))(
  ( (ValueCellFull!1186 (v!3439 V!3725)) (EmptyCell!1186) )
))
(declare-datatypes ((array!5171 0))(
  ( (array!5172 (arr!2443 (Array (_ BitVec 32) (_ BitVec 64))) (size!2721 (_ BitVec 32))) )
))
(declare-datatypes ((array!5173 0))(
  ( (array!5174 (arr!2444 (Array (_ BitVec 32) ValueCell!1186)) (size!2722 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1280 0))(
  ( (LongMapFixedSize!1281 (defaultEntry!3082 Int) (mask!7499 (_ BitVec 32)) (extraKeys!2823 (_ BitVec 32)) (zeroValue!2925 V!3725) (minValue!2925 V!3725) (_size!689 (_ BitVec 32)) (_keys!4857 array!5171) (_values!3065 array!5173) (_vacant!689 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1280)

(declare-datatypes ((List!1818 0))(
  ( (Nil!1815) (Cons!1814 (h!2423 (_ BitVec 64)) (t!6620 List!1818)) )
))
(declare-fun arrayNoDuplicates!0 (array!5171 (_ BitVec 32) List!1818) Bool)

(assert (=> b!155193 (= lt!81337 (arrayNoDuplicates!0 (_keys!4857 thiss!1248) #b00000000000000000000000000000000 Nil!1815))))

(declare-fun b!155194 () Bool)

(declare-fun res!73278 () Bool)

(assert (=> b!155194 (=> (not res!73278) (not e!101388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5171 (_ BitVec 32)) Bool)

(assert (=> b!155194 (= res!73278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4857 thiss!1248) (mask!7499 thiss!1248)))))

(declare-fun b!155195 () Bool)

(declare-fun res!73279 () Bool)

(assert (=> b!155195 (=> (not res!73279) (not e!101388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155195 (= res!73279 (validMask!0 (mask!7499 thiss!1248)))))

(declare-fun res!73276 () Bool)

(assert (=> start!15590 (=> (not res!73276) (not e!101388))))

(declare-fun valid!630 (LongMapFixedSize!1280) Bool)

(assert (=> start!15590 (= res!73276 (valid!630 thiss!1248))))

(assert (=> start!15590 e!101388))

(declare-fun e!101389 () Bool)

(assert (=> start!15590 e!101389))

(assert (=> start!15590 true))

(declare-fun b!155196 () Bool)

(declare-fun res!73275 () Bool)

(assert (=> b!155196 (=> (not res!73275) (not e!101388))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155196 (= res!73275 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155197 () Bool)

(declare-fun e!101390 () Bool)

(declare-fun e!101391 () Bool)

(declare-fun mapRes!5231 () Bool)

(assert (=> b!155197 (= e!101390 (and e!101391 mapRes!5231))))

(declare-fun condMapEmpty!5231 () Bool)

(declare-fun mapDefault!5231 () ValueCell!1186)

