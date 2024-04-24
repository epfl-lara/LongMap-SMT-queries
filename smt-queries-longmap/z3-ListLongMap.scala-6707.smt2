; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84382 () Bool)

(assert start!84382)

(declare-fun b_free!19915 () Bool)

(declare-fun b_next!19915 () Bool)

(assert (=> start!84382 (= b_free!19915 (not b_next!19915))))

(declare-fun tp!69349 () Bool)

(declare-fun b_and!31917 () Bool)

(assert (=> start!84382 (= tp!69349 b_and!31917)))

(declare-fun b!985955 () Bool)

(declare-fun e!555859 () Bool)

(declare-fun tp_is_empty!23017 () Bool)

(assert (=> b!985955 (= e!555859 tp_is_empty!23017)))

(declare-fun b!985956 () Bool)

(declare-fun e!555862 () Bool)

(declare-fun e!555861 () Bool)

(assert (=> b!985956 (= e!555862 e!555861)))

(declare-fun res!659496 () Bool)

(assert (=> b!985956 (=> (not res!659496) (not e!555861))))

(declare-datatypes ((array!62050 0))(
  ( (array!62051 (arr!29878 (Array (_ BitVec 32) (_ BitVec 64))) (size!30358 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62050)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985956 (= res!659496 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29878 _keys!1544) from!1932))))))

(declare-datatypes ((V!35673 0))(
  ( (V!35674 (val!11559 Int)) )
))
(declare-datatypes ((ValueCell!11027 0))(
  ( (ValueCellFull!11027 (v!14118 V!35673)) (EmptyCell!11027) )
))
(declare-datatypes ((array!62052 0))(
  ( (array!62053 (arr!29879 (Array (_ BitVec 32) ValueCell!11027)) (size!30359 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62052)

(declare-fun lt!437442 () V!35673)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15530 (ValueCell!11027 V!35673) V!35673)

(declare-fun dynLambda!1859 (Int (_ BitVec 64)) V!35673)

(assert (=> b!985956 (= lt!437442 (get!15530 (select (arr!29879 _values!1278) from!1932) (dynLambda!1859 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35673)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35673)

(declare-datatypes ((tuple2!14806 0))(
  ( (tuple2!14807 (_1!7414 (_ BitVec 64)) (_2!7414 V!35673)) )
))
(declare-datatypes ((List!20687 0))(
  ( (Nil!20684) (Cons!20683 (h!21851 tuple2!14806) (t!29538 List!20687)) )
))
(declare-datatypes ((ListLongMap!13505 0))(
  ( (ListLongMap!13506 (toList!6768 List!20687)) )
))
(declare-fun lt!437440 () ListLongMap!13505)

(declare-fun getCurrentListMapNoExtraKeys!3502 (array!62050 array!62052 (_ BitVec 32) (_ BitVec 32) V!35673 V!35673 (_ BitVec 32) Int) ListLongMap!13505)

(assert (=> b!985956 (= lt!437440 (getCurrentListMapNoExtraKeys!3502 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985957 () Bool)

(declare-fun e!555864 () Bool)

(declare-fun e!555863 () Bool)

(declare-fun mapRes!36554 () Bool)

(assert (=> b!985957 (= e!555864 (and e!555863 mapRes!36554))))

(declare-fun condMapEmpty!36554 () Bool)

(declare-fun mapDefault!36554 () ValueCell!11027)

(assert (=> b!985957 (= condMapEmpty!36554 (= (arr!29879 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11027)) mapDefault!36554)))))

(declare-fun b!985958 () Bool)

(declare-fun res!659501 () Bool)

(assert (=> b!985958 (=> (not res!659501) (not e!555862))))

(assert (=> b!985958 (= res!659501 (and (= (size!30359 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30358 _keys!1544) (size!30359 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985959 () Bool)

(assert (=> b!985959 (= e!555863 tp_is_empty!23017)))

(declare-fun b!985960 () Bool)

(declare-fun res!659503 () Bool)

(assert (=> b!985960 (=> (not res!659503) (not e!555862))))

(declare-datatypes ((List!20688 0))(
  ( (Nil!20685) (Cons!20684 (h!21852 (_ BitVec 64)) (t!29539 List!20688)) )
))
(declare-fun arrayNoDuplicates!0 (array!62050 (_ BitVec 32) List!20688) Bool)

(assert (=> b!985960 (= res!659503 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20685))))

(declare-fun b!985961 () Bool)

(declare-fun res!659500 () Bool)

(assert (=> b!985961 (=> (not res!659500) (not e!555862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985961 (= res!659500 (validKeyInArray!0 (select (arr!29878 _keys!1544) from!1932)))))

(declare-fun b!985962 () Bool)

(declare-fun res!659502 () Bool)

(assert (=> b!985962 (=> (not res!659502) (not e!555862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62050 (_ BitVec 32)) Bool)

(assert (=> b!985962 (= res!659502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36554 () Bool)

(declare-fun tp!69350 () Bool)

(assert (=> mapNonEmpty!36554 (= mapRes!36554 (and tp!69350 e!555859))))

(declare-fun mapRest!36554 () (Array (_ BitVec 32) ValueCell!11027))

(declare-fun mapKey!36554 () (_ BitVec 32))

(declare-fun mapValue!36554 () ValueCell!11027)

(assert (=> mapNonEmpty!36554 (= (arr!29879 _values!1278) (store mapRest!36554 mapKey!36554 mapValue!36554))))

(declare-fun b!985964 () Bool)

(assert (=> b!985964 (= e!555861 (not true))))

(declare-fun lt!437441 () tuple2!14806)

(declare-fun lt!437438 () tuple2!14806)

(declare-fun +!3069 (ListLongMap!13505 tuple2!14806) ListLongMap!13505)

(assert (=> b!985964 (= (+!3069 (+!3069 lt!437440 lt!437441) lt!437438) (+!3069 (+!3069 lt!437440 lt!437438) lt!437441))))

(assert (=> b!985964 (= lt!437438 (tuple2!14807 (select (arr!29878 _keys!1544) from!1932) lt!437442))))

(assert (=> b!985964 (= lt!437441 (tuple2!14807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32718 0))(
  ( (Unit!32719) )
))
(declare-fun lt!437439 () Unit!32718)

(declare-fun addCommutativeForDiffKeys!676 (ListLongMap!13505 (_ BitVec 64) V!35673 (_ BitVec 64) V!35673) Unit!32718)

(assert (=> b!985964 (= lt!437439 (addCommutativeForDiffKeys!676 lt!437440 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29878 _keys!1544) from!1932) lt!437442))))

(declare-fun b!985965 () Bool)

(declare-fun res!659498 () Bool)

(assert (=> b!985965 (=> (not res!659498) (not e!555862))))

(assert (=> b!985965 (= res!659498 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30358 _keys!1544))))))

(declare-fun mapIsEmpty!36554 () Bool)

(assert (=> mapIsEmpty!36554 mapRes!36554))

(declare-fun res!659497 () Bool)

(assert (=> start!84382 (=> (not res!659497) (not e!555862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84382 (= res!659497 (validMask!0 mask!1948))))

(assert (=> start!84382 e!555862))

(assert (=> start!84382 true))

(assert (=> start!84382 tp_is_empty!23017))

(declare-fun array_inv!23117 (array!62052) Bool)

(assert (=> start!84382 (and (array_inv!23117 _values!1278) e!555864)))

(assert (=> start!84382 tp!69349))

(declare-fun array_inv!23118 (array!62050) Bool)

(assert (=> start!84382 (array_inv!23118 _keys!1544)))

(declare-fun b!985963 () Bool)

(declare-fun res!659499 () Bool)

(assert (=> b!985963 (=> (not res!659499) (not e!555862))))

(assert (=> b!985963 (= res!659499 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!84382 res!659497) b!985958))

(assert (= (and b!985958 res!659501) b!985962))

(assert (= (and b!985962 res!659502) b!985960))

(assert (= (and b!985960 res!659503) b!985965))

(assert (= (and b!985965 res!659498) b!985961))

(assert (= (and b!985961 res!659500) b!985963))

(assert (= (and b!985963 res!659499) b!985956))

(assert (= (and b!985956 res!659496) b!985964))

(assert (= (and b!985957 condMapEmpty!36554) mapIsEmpty!36554))

(assert (= (and b!985957 (not condMapEmpty!36554)) mapNonEmpty!36554))

(get-info :version)

(assert (= (and mapNonEmpty!36554 ((_ is ValueCellFull!11027) mapValue!36554)) b!985955))

(assert (= (and b!985957 ((_ is ValueCellFull!11027) mapDefault!36554)) b!985959))

(assert (= start!84382 b!985957))

(declare-fun b_lambda!14961 () Bool)

(assert (=> (not b_lambda!14961) (not b!985956)))

(declare-fun t!29537 () Bool)

(declare-fun tb!6701 () Bool)

(assert (=> (and start!84382 (= defaultEntry!1281 defaultEntry!1281) t!29537) tb!6701))

(declare-fun result!13399 () Bool)

(assert (=> tb!6701 (= result!13399 tp_is_empty!23017)))

(assert (=> b!985956 t!29537))

(declare-fun b_and!31919 () Bool)

(assert (= b_and!31917 (and (=> t!29537 result!13399) b_and!31919)))

(declare-fun m!913415 () Bool)

(assert (=> b!985960 m!913415))

(declare-fun m!913417 () Bool)

(assert (=> b!985956 m!913417))

(declare-fun m!913419 () Bool)

(assert (=> b!985956 m!913419))

(declare-fun m!913421 () Bool)

(assert (=> b!985956 m!913421))

(declare-fun m!913423 () Bool)

(assert (=> b!985956 m!913423))

(assert (=> b!985956 m!913419))

(assert (=> b!985956 m!913423))

(declare-fun m!913425 () Bool)

(assert (=> b!985956 m!913425))

(declare-fun m!913427 () Bool)

(assert (=> mapNonEmpty!36554 m!913427))

(declare-fun m!913429 () Bool)

(assert (=> start!84382 m!913429))

(declare-fun m!913431 () Bool)

(assert (=> start!84382 m!913431))

(declare-fun m!913433 () Bool)

(assert (=> start!84382 m!913433))

(assert (=> b!985964 m!913417))

(declare-fun m!913435 () Bool)

(assert (=> b!985964 m!913435))

(declare-fun m!913437 () Bool)

(assert (=> b!985964 m!913437))

(assert (=> b!985964 m!913417))

(declare-fun m!913439 () Bool)

(assert (=> b!985964 m!913439))

(declare-fun m!913441 () Bool)

(assert (=> b!985964 m!913441))

(declare-fun m!913443 () Bool)

(assert (=> b!985964 m!913443))

(assert (=> b!985964 m!913435))

(assert (=> b!985964 m!913441))

(declare-fun m!913445 () Bool)

(assert (=> b!985962 m!913445))

(assert (=> b!985961 m!913417))

(assert (=> b!985961 m!913417))

(declare-fun m!913447 () Bool)

(assert (=> b!985961 m!913447))

(check-sat (not start!84382) (not b_lambda!14961) (not b!985964) (not mapNonEmpty!36554) (not b!985961) (not b_next!19915) (not b!985960) tp_is_empty!23017 b_and!31919 (not b!985956) (not b!985962))
(check-sat b_and!31919 (not b_next!19915))
