; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16060 () Bool)

(assert start!16060)

(declare-fun b!159404 () Bool)

(declare-fun b_free!3521 () Bool)

(declare-fun b_next!3521 () Bool)

(assert (=> b!159404 (= b_free!3521 (not b_next!3521))))

(declare-fun tp!13132 () Bool)

(declare-fun b_and!9935 () Bool)

(assert (=> b!159404 (= tp!13132 b_and!9935)))

(declare-fun b!159396 () Bool)

(declare-fun e!104338 () Bool)

(declare-fun tp_is_empty!3323 () Bool)

(assert (=> b!159396 (= e!104338 tp_is_empty!3323)))

(declare-fun b!159397 () Bool)

(declare-fun e!104337 () Bool)

(assert (=> b!159397 (= e!104337 false)))

(declare-fun lt!81994 () Bool)

(declare-datatypes ((V!4077 0))(
  ( (V!4078 (val!1706 Int)) )
))
(declare-datatypes ((ValueCell!1318 0))(
  ( (ValueCellFull!1318 (v!3571 V!4077)) (EmptyCell!1318) )
))
(declare-datatypes ((array!5725 0))(
  ( (array!5726 (arr!2707 (Array (_ BitVec 32) (_ BitVec 64))) (size!2991 (_ BitVec 32))) )
))
(declare-datatypes ((array!5727 0))(
  ( (array!5728 (arr!2708 (Array (_ BitVec 32) ValueCell!1318)) (size!2992 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1544 0))(
  ( (LongMapFixedSize!1545 (defaultEntry!3214 Int) (mask!7762 (_ BitVec 32)) (extraKeys!2955 (_ BitVec 32)) (zeroValue!3057 V!4077) (minValue!3057 V!4077) (_size!821 (_ BitVec 32)) (_keys!5015 array!5725) (_values!3197 array!5727) (_vacant!821 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1544)

(declare-datatypes ((List!1906 0))(
  ( (Nil!1903) (Cons!1902 (h!2515 (_ BitVec 64)) (t!6708 List!1906)) )
))
(declare-fun arrayNoDuplicates!0 (array!5725 (_ BitVec 32) List!1906) Bool)

(assert (=> b!159397 (= lt!81994 (arrayNoDuplicates!0 (_keys!5015 thiss!1248) #b00000000000000000000000000000000 Nil!1903))))

(declare-fun b!159398 () Bool)

(declare-fun e!104335 () Bool)

(assert (=> b!159398 (= e!104335 tp_is_empty!3323)))

(declare-fun mapNonEmpty!5672 () Bool)

(declare-fun mapRes!5672 () Bool)

(declare-fun tp!13133 () Bool)

(assert (=> mapNonEmpty!5672 (= mapRes!5672 (and tp!13133 e!104338))))

(declare-fun mapValue!5672 () ValueCell!1318)

(declare-fun mapRest!5672 () (Array (_ BitVec 32) ValueCell!1318))

(declare-fun mapKey!5672 () (_ BitVec 32))

(assert (=> mapNonEmpty!5672 (= (arr!2708 (_values!3197 thiss!1248)) (store mapRest!5672 mapKey!5672 mapValue!5672))))

(declare-fun res!75307 () Bool)

(assert (=> start!16060 (=> (not res!75307) (not e!104337))))

(declare-fun valid!723 (LongMapFixedSize!1544) Bool)

(assert (=> start!16060 (= res!75307 (valid!723 thiss!1248))))

(assert (=> start!16060 e!104337))

(declare-fun e!104340 () Bool)

(assert (=> start!16060 e!104340))

(assert (=> start!16060 true))

(declare-fun b!159399 () Bool)

(declare-fun e!104336 () Bool)

(assert (=> b!159399 (= e!104336 (and e!104335 mapRes!5672))))

(declare-fun condMapEmpty!5672 () Bool)

(declare-fun mapDefault!5672 () ValueCell!1318)

