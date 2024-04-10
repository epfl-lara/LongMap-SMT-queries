; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83306 () Bool)

(assert start!83306)

(declare-fun b_free!19299 () Bool)

(declare-fun b_next!19299 () Bool)

(assert (=> start!83306 (= b_free!19299 (not b_next!19299))))

(declare-fun tp!67176 () Bool)

(declare-fun b_and!30819 () Bool)

(assert (=> start!83306 (= tp!67176 b_and!30819)))

(declare-fun mapIsEmpty!35305 () Bool)

(declare-fun mapRes!35305 () Bool)

(assert (=> mapIsEmpty!35305 mapRes!35305))

(declare-fun b!972371 () Bool)

(declare-fun res!650864 () Bool)

(declare-fun e!548091 () Bool)

(assert (=> b!972371 (=> (not res!650864) (not e!548091))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34579 0))(
  ( (V!34580 (val!11149 Int)) )
))
(declare-datatypes ((ValueCell!10617 0))(
  ( (ValueCellFull!10617 (v!13708 V!34579)) (EmptyCell!10617) )
))
(declare-datatypes ((array!60441 0))(
  ( (array!60442 (arr!29084 (Array (_ BitVec 32) ValueCell!10617)) (size!29563 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60441)

(declare-fun zeroValue!1367 () V!34579)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34579)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60443 0))(
  ( (array!60444 (arr!29085 (Array (_ BitVec 32) (_ BitVec 64))) (size!29564 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60443)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14300 0))(
  ( (tuple2!14301 (_1!7161 (_ BitVec 64)) (_2!7161 V!34579)) )
))
(declare-datatypes ((List!20164 0))(
  ( (Nil!20161) (Cons!20160 (h!21322 tuple2!14300) (t!28561 List!20164)) )
))
(declare-datatypes ((ListLongMap!12997 0))(
  ( (ListLongMap!12998 (toList!6514 List!20164)) )
))
(declare-fun contains!5609 (ListLongMap!12997 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3747 (array!60443 array!60441 (_ BitVec 32) (_ BitVec 32) V!34579 V!34579 (_ BitVec 32) Int) ListLongMap!12997)

(assert (=> b!972371 (= res!650864 (contains!5609 (getCurrentListMap!3747 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29085 _keys!1717) i!822)))))

(declare-fun b!972372 () Bool)

(declare-fun res!650861 () Bool)

(assert (=> b!972372 (=> (not res!650861) (not e!548091))))

(assert (=> b!972372 (= res!650861 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29564 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29564 _keys!1717))))))

(declare-fun b!972373 () Bool)

(declare-fun e!548092 () Bool)

(declare-fun tp_is_empty!22197 () Bool)

(assert (=> b!972373 (= e!548092 tp_is_empty!22197)))

(declare-fun b!972375 () Bool)

(declare-fun e!548090 () Bool)

(assert (=> b!972375 (= e!548091 e!548090)))

(declare-fun res!650862 () Bool)

(assert (=> b!972375 (=> (not res!650862) (not e!548090))))

(declare-fun lt!432020 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972375 (= res!650862 (validKeyInArray!0 lt!432020))))

(assert (=> b!972375 (= lt!432020 (select (arr!29085 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432019 () ListLongMap!12997)

(assert (=> b!972375 (= lt!432019 (getCurrentListMap!3747 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972376 () Bool)

(declare-fun e!548093 () Bool)

(assert (=> b!972376 (= e!548093 tp_is_empty!22197)))

(declare-fun mapNonEmpty!35305 () Bool)

(declare-fun tp!67175 () Bool)

(assert (=> mapNonEmpty!35305 (= mapRes!35305 (and tp!67175 e!548093))))

(declare-fun mapValue!35305 () ValueCell!10617)

(declare-fun mapRest!35305 () (Array (_ BitVec 32) ValueCell!10617))

(declare-fun mapKey!35305 () (_ BitVec 32))

(assert (=> mapNonEmpty!35305 (= (arr!29084 _values!1425) (store mapRest!35305 mapKey!35305 mapValue!35305))))

(declare-fun b!972377 () Bool)

(declare-fun e!548095 () Bool)

(assert (=> b!972377 (= e!548095 (and e!548092 mapRes!35305))))

(declare-fun condMapEmpty!35305 () Bool)

(declare-fun mapDefault!35305 () ValueCell!10617)

(assert (=> b!972377 (= condMapEmpty!35305 (= (arr!29084 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10617)) mapDefault!35305)))))

(declare-fun b!972378 () Bool)

(declare-fun res!650868 () Bool)

(assert (=> b!972378 (=> (not res!650868) (not e!548091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60443 (_ BitVec 32)) Bool)

(assert (=> b!972378 (= res!650868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!650865 () Bool)

(assert (=> start!83306 (=> (not res!650865) (not e!548091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83306 (= res!650865 (validMask!0 mask!2147))))

(assert (=> start!83306 e!548091))

(assert (=> start!83306 true))

(declare-fun array_inv!22497 (array!60441) Bool)

(assert (=> start!83306 (and (array_inv!22497 _values!1425) e!548095)))

(assert (=> start!83306 tp_is_empty!22197))

(assert (=> start!83306 tp!67176))

(declare-fun array_inv!22498 (array!60443) Bool)

(assert (=> start!83306 (array_inv!22498 _keys!1717)))

(declare-fun b!972374 () Bool)

(declare-fun res!650863 () Bool)

(assert (=> b!972374 (=> (not res!650863) (not e!548091))))

(declare-datatypes ((List!20165 0))(
  ( (Nil!20162) (Cons!20161 (h!21323 (_ BitVec 64)) (t!28562 List!20165)) )
))
(declare-fun arrayNoDuplicates!0 (array!60443 (_ BitVec 32) List!20165) Bool)

(assert (=> b!972374 (= res!650863 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20162))))

(declare-fun b!972379 () Bool)

(declare-fun res!650866 () Bool)

(assert (=> b!972379 (=> (not res!650866) (not e!548091))))

(assert (=> b!972379 (= res!650866 (and (= (size!29563 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29564 _keys!1717) (size!29563 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972380 () Bool)

(assert (=> b!972380 (= e!548090 (not true))))

(declare-fun +!2888 (ListLongMap!12997 tuple2!14300) ListLongMap!12997)

(declare-fun get!15067 (ValueCell!10617 V!34579) V!34579)

(declare-fun dynLambda!1677 (Int (_ BitVec 64)) V!34579)

(assert (=> b!972380 (= lt!432019 (+!2888 (getCurrentListMap!3747 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14301 lt!432020 (get!15067 (select (arr!29084 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1677 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32397 0))(
  ( (Unit!32398) )
))
(declare-fun lt!432018 () Unit!32397)

(declare-fun lemmaListMapRecursiveValidKeyArray!254 (array!60443 array!60441 (_ BitVec 32) (_ BitVec 32) V!34579 V!34579 (_ BitVec 32) Int) Unit!32397)

(assert (=> b!972380 (= lt!432018 (lemmaListMapRecursiveValidKeyArray!254 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972381 () Bool)

(declare-fun res!650867 () Bool)

(assert (=> b!972381 (=> (not res!650867) (not e!548091))))

(assert (=> b!972381 (= res!650867 (validKeyInArray!0 (select (arr!29085 _keys!1717) i!822)))))

(assert (= (and start!83306 res!650865) b!972379))

(assert (= (and b!972379 res!650866) b!972378))

(assert (= (and b!972378 res!650868) b!972374))

(assert (= (and b!972374 res!650863) b!972372))

(assert (= (and b!972372 res!650861) b!972381))

(assert (= (and b!972381 res!650867) b!972371))

(assert (= (and b!972371 res!650864) b!972375))

(assert (= (and b!972375 res!650862) b!972380))

(assert (= (and b!972377 condMapEmpty!35305) mapIsEmpty!35305))

(assert (= (and b!972377 (not condMapEmpty!35305)) mapNonEmpty!35305))

(get-info :version)

(assert (= (and mapNonEmpty!35305 ((_ is ValueCellFull!10617) mapValue!35305)) b!972376))

(assert (= (and b!972377 ((_ is ValueCellFull!10617) mapDefault!35305)) b!972373))

(assert (= start!83306 b!972377))

(declare-fun b_lambda!14463 () Bool)

(assert (=> (not b_lambda!14463) (not b!972380)))

(declare-fun t!28560 () Bool)

(declare-fun tb!6247 () Bool)

(assert (=> (and start!83306 (= defaultEntry!1428 defaultEntry!1428) t!28560) tb!6247))

(declare-fun result!12471 () Bool)

(assert (=> tb!6247 (= result!12471 tp_is_empty!22197)))

(assert (=> b!972380 t!28560))

(declare-fun b_and!30821 () Bool)

(assert (= b_and!30819 (and (=> t!28560 result!12471) b_and!30821)))

(declare-fun m!899775 () Bool)

(assert (=> b!972375 m!899775))

(declare-fun m!899777 () Bool)

(assert (=> b!972375 m!899777))

(declare-fun m!899779 () Bool)

(assert (=> b!972375 m!899779))

(declare-fun m!899781 () Bool)

(assert (=> start!83306 m!899781))

(declare-fun m!899783 () Bool)

(assert (=> start!83306 m!899783))

(declare-fun m!899785 () Bool)

(assert (=> start!83306 m!899785))

(declare-fun m!899787 () Bool)

(assert (=> b!972374 m!899787))

(declare-fun m!899789 () Bool)

(assert (=> b!972378 m!899789))

(declare-fun m!899791 () Bool)

(assert (=> b!972380 m!899791))

(declare-fun m!899793 () Bool)

(assert (=> b!972380 m!899793))

(declare-fun m!899795 () Bool)

(assert (=> b!972380 m!899795))

(assert (=> b!972380 m!899791))

(declare-fun m!899797 () Bool)

(assert (=> b!972380 m!899797))

(assert (=> b!972380 m!899795))

(assert (=> b!972380 m!899797))

(declare-fun m!899799 () Bool)

(assert (=> b!972380 m!899799))

(declare-fun m!899801 () Bool)

(assert (=> b!972380 m!899801))

(declare-fun m!899803 () Bool)

(assert (=> b!972371 m!899803))

(declare-fun m!899805 () Bool)

(assert (=> b!972371 m!899805))

(assert (=> b!972371 m!899803))

(assert (=> b!972371 m!899805))

(declare-fun m!899807 () Bool)

(assert (=> b!972371 m!899807))

(assert (=> b!972381 m!899805))

(assert (=> b!972381 m!899805))

(declare-fun m!899809 () Bool)

(assert (=> b!972381 m!899809))

(declare-fun m!899811 () Bool)

(assert (=> mapNonEmpty!35305 m!899811))

(check-sat (not b!972380) (not b!972381) (not b!972371) (not mapNonEmpty!35305) tp_is_empty!22197 (not b!972374) b_and!30821 (not b!972378) (not b_next!19299) (not b_lambda!14463) (not start!83306) (not b!972375))
(check-sat b_and!30821 (not b_next!19299))
