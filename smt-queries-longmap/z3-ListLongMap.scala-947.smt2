; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20780 () Bool)

(assert start!20780)

(declare-fun b_free!5433 () Bool)

(declare-fun b_next!5433 () Bool)

(assert (=> start!20780 (= b_free!5433 (not b_next!5433))))

(declare-fun tp!19339 () Bool)

(declare-fun b_and!12179 () Bool)

(assert (=> start!20780 (= tp!19339 b_and!12179)))

(declare-fun b!208160 () Bool)

(declare-fun res!101204 () Bool)

(declare-fun e!135806 () Bool)

(assert (=> b!208160 (=> (not res!101204) (not e!135806))))

(declare-datatypes ((array!9795 0))(
  ( (array!9796 (arr!4648 (Array (_ BitVec 32) (_ BitVec 64))) (size!4973 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9795)

(declare-datatypes ((List!2975 0))(
  ( (Nil!2972) (Cons!2971 (h!3613 (_ BitVec 64)) (t!7906 List!2975)) )
))
(declare-fun arrayNoDuplicates!0 (array!9795 (_ BitVec 32) List!2975) Bool)

(assert (=> b!208160 (= res!101204 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2972))))

(declare-fun res!101201 () Bool)

(assert (=> start!20780 (=> (not res!101201) (not e!135806))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20780 (= res!101201 (validMask!0 mask!1149))))

(assert (=> start!20780 e!135806))

(declare-datatypes ((V!6707 0))(
  ( (V!6708 (val!2692 Int)) )
))
(declare-datatypes ((ValueCell!2304 0))(
  ( (ValueCellFull!2304 (v!4662 V!6707)) (EmptyCell!2304) )
))
(declare-datatypes ((array!9797 0))(
  ( (array!9798 (arr!4649 (Array (_ BitVec 32) ValueCell!2304)) (size!4974 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9797)

(declare-fun e!135809 () Bool)

(declare-fun array_inv!3083 (array!9797) Bool)

(assert (=> start!20780 (and (array_inv!3083 _values!649) e!135809)))

(assert (=> start!20780 true))

(declare-fun tp_is_empty!5295 () Bool)

(assert (=> start!20780 tp_is_empty!5295))

(declare-fun array_inv!3084 (array!9795) Bool)

(assert (=> start!20780 (array_inv!3084 _keys!825)))

(assert (=> start!20780 tp!19339))

(declare-fun b!208161 () Bool)

(declare-fun res!101202 () Bool)

(assert (=> b!208161 (=> (not res!101202) (not e!135806))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208161 (= res!101202 (and (= (size!4974 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4973 _keys!825) (size!4974 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208162 () Bool)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208162 (= e!135806 (bvsge i!601 (size!4974 _values!649)))))

(declare-datatypes ((tuple2!4080 0))(
  ( (tuple2!4081 (_1!2051 (_ BitVec 64)) (_2!2051 V!6707)) )
))
(declare-datatypes ((List!2976 0))(
  ( (Nil!2973) (Cons!2972 (h!3614 tuple2!4080) (t!7907 List!2976)) )
))
(declare-datatypes ((ListLongMap!2993 0))(
  ( (ListLongMap!2994 (toList!1512 List!2976)) )
))
(declare-fun lt!106734 () ListLongMap!2993)

(declare-fun zeroValue!615 () V!6707)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6707)

(declare-fun getCurrentListMapNoExtraKeys!453 (array!9795 array!9797 (_ BitVec 32) (_ BitVec 32) V!6707 V!6707 (_ BitVec 32) Int) ListLongMap!2993)

(assert (=> b!208162 (= lt!106734 (getCurrentListMapNoExtraKeys!453 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!9011 () Bool)

(declare-fun mapRes!9011 () Bool)

(assert (=> mapIsEmpty!9011 mapRes!9011))

(declare-fun b!208163 () Bool)

(declare-fun e!135808 () Bool)

(assert (=> b!208163 (= e!135808 tp_is_empty!5295)))

(declare-fun b!208164 () Bool)

(declare-fun e!135805 () Bool)

(assert (=> b!208164 (= e!135805 tp_is_empty!5295)))

(declare-fun b!208165 () Bool)

(declare-fun res!101206 () Bool)

(assert (=> b!208165 (=> (not res!101206) (not e!135806))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208165 (= res!101206 (validKeyInArray!0 k0!843))))

(declare-fun b!208166 () Bool)

(declare-fun res!101203 () Bool)

(assert (=> b!208166 (=> (not res!101203) (not e!135806))))

(assert (=> b!208166 (= res!101203 (= (select (arr!4648 _keys!825) i!601) k0!843))))

(declare-fun b!208167 () Bool)

(assert (=> b!208167 (= e!135809 (and e!135808 mapRes!9011))))

(declare-fun condMapEmpty!9011 () Bool)

(declare-fun mapDefault!9011 () ValueCell!2304)

(assert (=> b!208167 (= condMapEmpty!9011 (= (arr!4649 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2304)) mapDefault!9011)))))

(declare-fun b!208168 () Bool)

(declare-fun res!101200 () Bool)

(assert (=> b!208168 (=> (not res!101200) (not e!135806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9795 (_ BitVec 32)) Bool)

(assert (=> b!208168 (= res!101200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208169 () Bool)

(declare-fun res!101205 () Bool)

(assert (=> b!208169 (=> (not res!101205) (not e!135806))))

(assert (=> b!208169 (= res!101205 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4973 _keys!825))))))

(declare-fun mapNonEmpty!9011 () Bool)

(declare-fun tp!19340 () Bool)

(assert (=> mapNonEmpty!9011 (= mapRes!9011 (and tp!19340 e!135805))))

(declare-fun mapRest!9011 () (Array (_ BitVec 32) ValueCell!2304))

(declare-fun mapKey!9011 () (_ BitVec 32))

(declare-fun mapValue!9011 () ValueCell!2304)

(assert (=> mapNonEmpty!9011 (= (arr!4649 _values!649) (store mapRest!9011 mapKey!9011 mapValue!9011))))

(assert (= (and start!20780 res!101201) b!208161))

(assert (= (and b!208161 res!101202) b!208168))

(assert (= (and b!208168 res!101200) b!208160))

(assert (= (and b!208160 res!101204) b!208169))

(assert (= (and b!208169 res!101205) b!208165))

(assert (= (and b!208165 res!101206) b!208166))

(assert (= (and b!208166 res!101203) b!208162))

(assert (= (and b!208167 condMapEmpty!9011) mapIsEmpty!9011))

(assert (= (and b!208167 (not condMapEmpty!9011)) mapNonEmpty!9011))

(get-info :version)

(assert (= (and mapNonEmpty!9011 ((_ is ValueCellFull!2304) mapValue!9011)) b!208164))

(assert (= (and b!208167 ((_ is ValueCellFull!2304) mapDefault!9011)) b!208163))

(assert (= start!20780 b!208167))

(declare-fun m!235873 () Bool)

(assert (=> b!208160 m!235873))

(declare-fun m!235875 () Bool)

(assert (=> start!20780 m!235875))

(declare-fun m!235877 () Bool)

(assert (=> start!20780 m!235877))

(declare-fun m!235879 () Bool)

(assert (=> start!20780 m!235879))

(declare-fun m!235881 () Bool)

(assert (=> b!208166 m!235881))

(declare-fun m!235883 () Bool)

(assert (=> b!208165 m!235883))

(declare-fun m!235885 () Bool)

(assert (=> b!208162 m!235885))

(declare-fun m!235887 () Bool)

(assert (=> mapNonEmpty!9011 m!235887))

(declare-fun m!235889 () Bool)

(assert (=> b!208168 m!235889))

(check-sat (not b!208168) (not b_next!5433) (not start!20780) (not b!208160) tp_is_empty!5295 b_and!12179 (not b!208165) (not mapNonEmpty!9011) (not b!208162))
(check-sat b_and!12179 (not b_next!5433))
