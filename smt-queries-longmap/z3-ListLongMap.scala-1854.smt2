; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33478 () Bool)

(assert start!33478)

(declare-fun b!332366 () Bool)

(declare-fun res!183125 () Bool)

(declare-fun e!204089 () Bool)

(assert (=> b!332366 (=> (not res!183125) (not e!204089))))

(declare-datatypes ((array!17084 0))(
  ( (array!17085 (arr!8076 (Array (_ BitVec 32) (_ BitVec 64))) (size!8428 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17084)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17084 (_ BitVec 32)) Bool)

(assert (=> b!332366 (= res!183125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11502 () Bool)

(declare-fun mapRes!11502 () Bool)

(declare-fun tp!23877 () Bool)

(declare-fun e!204088 () Bool)

(assert (=> mapNonEmpty!11502 (= mapRes!11502 (and tp!23877 e!204088))))

(declare-datatypes ((V!9971 0))(
  ( (V!9972 (val!3417 Int)) )
))
(declare-datatypes ((ValueCell!3029 0))(
  ( (ValueCellFull!3029 (v!5577 V!9971)) (EmptyCell!3029) )
))
(declare-fun mapValue!11502 () ValueCell!3029)

(declare-datatypes ((array!17086 0))(
  ( (array!17087 (arr!8077 (Array (_ BitVec 32) ValueCell!3029)) (size!8429 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17086)

(declare-fun mapRest!11502 () (Array (_ BitVec 32) ValueCell!3029))

(declare-fun mapKey!11502 () (_ BitVec 32))

(assert (=> mapNonEmpty!11502 (= (arr!8077 _values!1525) (store mapRest!11502 mapKey!11502 mapValue!11502))))

(declare-fun b!332367 () Bool)

(declare-fun res!183122 () Bool)

(assert (=> b!332367 (=> (not res!183122) (not e!204089))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332367 (= res!183122 (validKeyInArray!0 k0!1348))))

(declare-fun b!332368 () Bool)

(declare-fun e!204092 () Bool)

(declare-fun tp_is_empty!6745 () Bool)

(assert (=> b!332368 (= e!204092 tp_is_empty!6745)))

(declare-fun res!183121 () Bool)

(assert (=> start!33478 (=> (not res!183121) (not e!204089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33478 (= res!183121 (validMask!0 mask!2385))))

(assert (=> start!33478 e!204089))

(assert (=> start!33478 true))

(declare-fun e!204091 () Bool)

(declare-fun array_inv!6008 (array!17086) Bool)

(assert (=> start!33478 (and (array_inv!6008 _values!1525) e!204091)))

(declare-fun array_inv!6009 (array!17084) Bool)

(assert (=> start!33478 (array_inv!6009 _keys!1895)))

(declare-fun b!332369 () Bool)

(assert (=> b!332369 (= e!204088 tp_is_empty!6745)))

(declare-fun b!332370 () Bool)

(assert (=> b!332370 (= e!204089 (bvsgt #b00000000000000000000000000000000 (size!8428 _keys!1895)))))

(declare-fun mapIsEmpty!11502 () Bool)

(assert (=> mapIsEmpty!11502 mapRes!11502))

(declare-fun b!332371 () Bool)

(assert (=> b!332371 (= e!204091 (and e!204092 mapRes!11502))))

(declare-fun condMapEmpty!11502 () Bool)

(declare-fun mapDefault!11502 () ValueCell!3029)

(assert (=> b!332371 (= condMapEmpty!11502 (= (arr!8077 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3029)) mapDefault!11502)))))

(declare-fun b!332372 () Bool)

(declare-fun res!183123 () Bool)

(assert (=> b!332372 (=> (not res!183123) (not e!204089))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332372 (= res!183123 (and (= (size!8429 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8428 _keys!1895) (size!8429 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332373 () Bool)

(declare-fun res!183124 () Bool)

(assert (=> b!332373 (=> (not res!183124) (not e!204089))))

(declare-datatypes ((List!4507 0))(
  ( (Nil!4504) (Cons!4503 (h!5359 (_ BitVec 64)) (t!9581 List!4507)) )
))
(declare-fun arrayNoDuplicates!0 (array!17084 (_ BitVec 32) List!4507) Bool)

(assert (=> b!332373 (= res!183124 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4504))))

(assert (= (and start!33478 res!183121) b!332372))

(assert (= (and b!332372 res!183123) b!332366))

(assert (= (and b!332366 res!183125) b!332373))

(assert (= (and b!332373 res!183124) b!332367))

(assert (= (and b!332367 res!183122) b!332370))

(assert (= (and b!332371 condMapEmpty!11502) mapIsEmpty!11502))

(assert (= (and b!332371 (not condMapEmpty!11502)) mapNonEmpty!11502))

(get-info :version)

(assert (= (and mapNonEmpty!11502 ((_ is ValueCellFull!3029) mapValue!11502)) b!332369))

(assert (= (and b!332371 ((_ is ValueCellFull!3029) mapDefault!11502)) b!332368))

(assert (= start!33478 b!332371))

(declare-fun m!337169 () Bool)

(assert (=> b!332366 m!337169))

(declare-fun m!337171 () Bool)

(assert (=> b!332367 m!337171))

(declare-fun m!337173 () Bool)

(assert (=> b!332373 m!337173))

(declare-fun m!337175 () Bool)

(assert (=> start!33478 m!337175))

(declare-fun m!337177 () Bool)

(assert (=> start!33478 m!337177))

(declare-fun m!337179 () Bool)

(assert (=> start!33478 m!337179))

(declare-fun m!337181 () Bool)

(assert (=> mapNonEmpty!11502 m!337181))

(check-sat (not b!332373) tp_is_empty!6745 (not mapNonEmpty!11502) (not b!332366) (not start!33478) (not b!332367))
(check-sat)
(get-model)

(declare-fun d!70549 () Bool)

(assert (=> d!70549 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332367 d!70549))

(declare-fun d!70551 () Bool)

(assert (=> d!70551 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33478 d!70551))

(declare-fun d!70553 () Bool)

(assert (=> d!70553 (= (array_inv!6008 _values!1525) (bvsge (size!8429 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33478 d!70553))

(declare-fun d!70555 () Bool)

(assert (=> d!70555 (= (array_inv!6009 _keys!1895) (bvsge (size!8428 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33478 d!70555))

(declare-fun bm!26195 () Bool)

(declare-fun call!26198 () Bool)

(assert (=> bm!26195 (= call!26198 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!332430 () Bool)

(declare-fun e!204129 () Bool)

(assert (=> b!332430 (= e!204129 call!26198)))

(declare-fun d!70557 () Bool)

(declare-fun res!183160 () Bool)

(declare-fun e!204130 () Bool)

(assert (=> d!70557 (=> res!183160 e!204130)))

(assert (=> d!70557 (= res!183160 (bvsge #b00000000000000000000000000000000 (size!8428 _keys!1895)))))

(assert (=> d!70557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204130)))

(declare-fun b!332431 () Bool)

(declare-fun e!204131 () Bool)

(assert (=> b!332431 (= e!204129 e!204131)))

(declare-fun lt!159036 () (_ BitVec 64))

(assert (=> b!332431 (= lt!159036 (select (arr!8076 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10335 0))(
  ( (Unit!10336) )
))
(declare-fun lt!159035 () Unit!10335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17084 (_ BitVec 64) (_ BitVec 32)) Unit!10335)

(assert (=> b!332431 (= lt!159035 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159036 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!332431 (arrayContainsKey!0 _keys!1895 lt!159036 #b00000000000000000000000000000000)))

(declare-fun lt!159037 () Unit!10335)

(assert (=> b!332431 (= lt!159037 lt!159035)))

(declare-fun res!183161 () Bool)

(declare-datatypes ((SeekEntryResult!3096 0))(
  ( (MissingZero!3096 (index!14563 (_ BitVec 32))) (Found!3096 (index!14564 (_ BitVec 32))) (Intermediate!3096 (undefined!3908 Bool) (index!14565 (_ BitVec 32)) (x!33077 (_ BitVec 32))) (Undefined!3096) (MissingVacant!3096 (index!14566 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17084 (_ BitVec 32)) SeekEntryResult!3096)

(assert (=> b!332431 (= res!183161 (= (seekEntryOrOpen!0 (select (arr!8076 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3096 #b00000000000000000000000000000000)))))

(assert (=> b!332431 (=> (not res!183161) (not e!204131))))

(declare-fun b!332432 () Bool)

(assert (=> b!332432 (= e!204131 call!26198)))

(declare-fun b!332433 () Bool)

(assert (=> b!332433 (= e!204130 e!204129)))

(declare-fun c!52058 () Bool)

(assert (=> b!332433 (= c!52058 (validKeyInArray!0 (select (arr!8076 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70557 (not res!183160)) b!332433))

(assert (= (and b!332433 c!52058) b!332431))

(assert (= (and b!332433 (not c!52058)) b!332430))

(assert (= (and b!332431 res!183161) b!332432))

(assert (= (or b!332432 b!332430) bm!26195))

(declare-fun m!337211 () Bool)

(assert (=> bm!26195 m!337211))

(declare-fun m!337213 () Bool)

(assert (=> b!332431 m!337213))

(declare-fun m!337215 () Bool)

(assert (=> b!332431 m!337215))

(declare-fun m!337217 () Bool)

(assert (=> b!332431 m!337217))

(assert (=> b!332431 m!337213))

(declare-fun m!337219 () Bool)

(assert (=> b!332431 m!337219))

(assert (=> b!332433 m!337213))

(assert (=> b!332433 m!337213))

(declare-fun m!337221 () Bool)

(assert (=> b!332433 m!337221))

(assert (=> b!332366 d!70557))

(declare-fun b!332444 () Bool)

(declare-fun e!204143 () Bool)

(declare-fun call!26201 () Bool)

(assert (=> b!332444 (= e!204143 call!26201)))

(declare-fun b!332446 () Bool)

(assert (=> b!332446 (= e!204143 call!26201)))

(declare-fun b!332447 () Bool)

(declare-fun e!204142 () Bool)

(declare-fun contains!1978 (List!4507 (_ BitVec 64)) Bool)

(assert (=> b!332447 (= e!204142 (contains!1978 Nil!4504 (select (arr!8076 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332445 () Bool)

(declare-fun e!204141 () Bool)

(assert (=> b!332445 (= e!204141 e!204143)))

(declare-fun c!52061 () Bool)

(assert (=> b!332445 (= c!52061 (validKeyInArray!0 (select (arr!8076 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70559 () Bool)

(declare-fun res!183169 () Bool)

(declare-fun e!204140 () Bool)

(assert (=> d!70559 (=> res!183169 e!204140)))

(assert (=> d!70559 (= res!183169 (bvsge #b00000000000000000000000000000000 (size!8428 _keys!1895)))))

(assert (=> d!70559 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4504) e!204140)))

(declare-fun bm!26198 () Bool)

(assert (=> bm!26198 (= call!26201 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52061 (Cons!4503 (select (arr!8076 _keys!1895) #b00000000000000000000000000000000) Nil!4504) Nil!4504)))))

(declare-fun b!332448 () Bool)

(assert (=> b!332448 (= e!204140 e!204141)))

(declare-fun res!183170 () Bool)

(assert (=> b!332448 (=> (not res!183170) (not e!204141))))

(assert (=> b!332448 (= res!183170 (not e!204142))))

(declare-fun res!183168 () Bool)

(assert (=> b!332448 (=> (not res!183168) (not e!204142))))

(assert (=> b!332448 (= res!183168 (validKeyInArray!0 (select (arr!8076 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70559 (not res!183169)) b!332448))

(assert (= (and b!332448 res!183168) b!332447))

(assert (= (and b!332448 res!183170) b!332445))

(assert (= (and b!332445 c!52061) b!332444))

(assert (= (and b!332445 (not c!52061)) b!332446))

(assert (= (or b!332444 b!332446) bm!26198))

(assert (=> b!332447 m!337213))

(assert (=> b!332447 m!337213))

(declare-fun m!337223 () Bool)

(assert (=> b!332447 m!337223))

(assert (=> b!332445 m!337213))

(assert (=> b!332445 m!337213))

(assert (=> b!332445 m!337221))

(assert (=> bm!26198 m!337213))

(declare-fun m!337225 () Bool)

(assert (=> bm!26198 m!337225))

(assert (=> b!332448 m!337213))

(assert (=> b!332448 m!337213))

(assert (=> b!332448 m!337221))

(assert (=> b!332373 d!70559))

(declare-fun b!332456 () Bool)

(declare-fun e!204148 () Bool)

(assert (=> b!332456 (= e!204148 tp_is_empty!6745)))

(declare-fun mapNonEmpty!11511 () Bool)

(declare-fun mapRes!11511 () Bool)

(declare-fun tp!23886 () Bool)

(declare-fun e!204149 () Bool)

(assert (=> mapNonEmpty!11511 (= mapRes!11511 (and tp!23886 e!204149))))

(declare-fun mapRest!11511 () (Array (_ BitVec 32) ValueCell!3029))

(declare-fun mapValue!11511 () ValueCell!3029)

(declare-fun mapKey!11511 () (_ BitVec 32))

(assert (=> mapNonEmpty!11511 (= mapRest!11502 (store mapRest!11511 mapKey!11511 mapValue!11511))))

(declare-fun condMapEmpty!11511 () Bool)

(declare-fun mapDefault!11511 () ValueCell!3029)

(assert (=> mapNonEmpty!11502 (= condMapEmpty!11511 (= mapRest!11502 ((as const (Array (_ BitVec 32) ValueCell!3029)) mapDefault!11511)))))

(assert (=> mapNonEmpty!11502 (= tp!23877 (and e!204148 mapRes!11511))))

(declare-fun b!332455 () Bool)

(assert (=> b!332455 (= e!204149 tp_is_empty!6745)))

(declare-fun mapIsEmpty!11511 () Bool)

(assert (=> mapIsEmpty!11511 mapRes!11511))

(assert (= (and mapNonEmpty!11502 condMapEmpty!11511) mapIsEmpty!11511))

(assert (= (and mapNonEmpty!11502 (not condMapEmpty!11511)) mapNonEmpty!11511))

(assert (= (and mapNonEmpty!11511 ((_ is ValueCellFull!3029) mapValue!11511)) b!332455))

(assert (= (and mapNonEmpty!11502 ((_ is ValueCellFull!3029) mapDefault!11511)) b!332456))

(declare-fun m!337227 () Bool)

(assert (=> mapNonEmpty!11511 m!337227))

(check-sat (not b!332445) (not b!332447) (not bm!26198) (not mapNonEmpty!11511) (not bm!26195) tp_is_empty!6745 (not b!332448) (not b!332433) (not b!332431))
(check-sat)
