; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16566 () Bool)

(assert start!16566)

(declare-fun b!165018 () Bool)

(declare-fun b_free!3871 () Bool)

(declare-fun b_next!3871 () Bool)

(assert (=> b!165018 (= b_free!3871 (not b_next!3871))))

(declare-fun tp!14214 () Bool)

(declare-fun b_and!10285 () Bool)

(assert (=> b!165018 (= tp!14214 b_and!10285)))

(declare-fun b!165008 () Bool)

(declare-fun e!108253 () Bool)

(declare-fun tp_is_empty!3673 () Bool)

(assert (=> b!165008 (= e!108253 tp_is_empty!3673)))

(declare-fun res!78221 () Bool)

(declare-fun e!108251 () Bool)

(assert (=> start!16566 (=> (not res!78221) (not e!108251))))

(declare-datatypes ((V!4545 0))(
  ( (V!4546 (val!1881 Int)) )
))
(declare-datatypes ((ValueCell!1493 0))(
  ( (ValueCellFull!1493 (v!3746 V!4545)) (EmptyCell!1493) )
))
(declare-datatypes ((array!6443 0))(
  ( (array!6444 (arr!3057 (Array (_ BitVec 32) (_ BitVec 64))) (size!3345 (_ BitVec 32))) )
))
(declare-datatypes ((array!6445 0))(
  ( (array!6446 (arr!3058 (Array (_ BitVec 32) ValueCell!1493)) (size!3346 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1894 0))(
  ( (LongMapFixedSize!1895 (defaultEntry!3389 Int) (mask!8092 (_ BitVec 32)) (extraKeys!3130 (_ BitVec 32)) (zeroValue!3232 V!4545) (minValue!3232 V!4545) (_size!996 (_ BitVec 32)) (_keys!5214 array!6443) (_values!3372 array!6445) (_vacant!996 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1894)

(declare-fun valid!840 (LongMapFixedSize!1894) Bool)

(assert (=> start!16566 (= res!78221 (valid!840 thiss!1248))))

(assert (=> start!16566 e!108251))

(declare-fun e!108250 () Bool)

(assert (=> start!16566 e!108250))

(assert (=> start!16566 true))

(declare-fun b!165009 () Bool)

(declare-fun e!108252 () Bool)

(assert (=> b!165009 (= e!108252 false)))

(declare-fun lt!82993 () Bool)

(declare-datatypes ((List!2033 0))(
  ( (Nil!2030) (Cons!2029 (h!2646 (_ BitVec 64)) (t!6835 List!2033)) )
))
(declare-fun arrayNoDuplicates!0 (array!6443 (_ BitVec 32) List!2033) Bool)

(assert (=> b!165009 (= lt!82993 (arrayNoDuplicates!0 (_keys!5214 thiss!1248) #b00000000000000000000000000000000 Nil!2030))))

(declare-fun b!165010 () Bool)

(declare-fun e!108248 () Bool)

(assert (=> b!165010 (= e!108248 tp_is_empty!3673)))

(declare-fun b!165011 () Bool)

(declare-fun e!108254 () Bool)

(declare-fun mapRes!6228 () Bool)

(assert (=> b!165011 (= e!108254 (and e!108253 mapRes!6228))))

(declare-fun condMapEmpty!6228 () Bool)

(declare-fun mapDefault!6228 () ValueCell!1493)

