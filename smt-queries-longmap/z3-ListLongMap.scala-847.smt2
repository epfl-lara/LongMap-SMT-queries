; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20182 () Bool)

(assert start!20182)

(declare-fun b_free!4837 () Bool)

(declare-fun b_next!4837 () Bool)

(assert (=> start!20182 (= b_free!4837 (not b_next!4837))))

(declare-fun tp!17542 () Bool)

(declare-fun b_and!11557 () Bool)

(assert (=> start!20182 (= tp!17542 b_and!11557)))

(declare-fun b!197957 () Bool)

(declare-fun res!93759 () Bool)

(declare-fun e!130155 () Bool)

(assert (=> b!197957 (=> (not res!93759) (not e!130155))))

(declare-datatypes ((array!8615 0))(
  ( (array!8616 (arr!4057 (Array (_ BitVec 32) (_ BitVec 64))) (size!4383 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8615)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197957 (= res!93759 (= (select (arr!4057 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8108 () Bool)

(declare-fun mapRes!8108 () Bool)

(assert (=> mapIsEmpty!8108 mapRes!8108))

(declare-fun b!197958 () Bool)

(declare-fun res!93761 () Bool)

(assert (=> b!197958 (=> (not res!93761) (not e!130155))))

(declare-datatypes ((List!2523 0))(
  ( (Nil!2520) (Cons!2519 (h!3161 (_ BitVec 64)) (t!7445 List!2523)) )
))
(declare-fun arrayNoDuplicates!0 (array!8615 (_ BitVec 32) List!2523) Bool)

(assert (=> b!197958 (= res!93761 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2520))))

(declare-fun b!197959 () Bool)

(declare-fun e!130154 () Bool)

(declare-fun e!130157 () Bool)

(assert (=> b!197959 (= e!130154 (and e!130157 mapRes!8108))))

(declare-fun condMapEmpty!8108 () Bool)

(declare-datatypes ((V!5905 0))(
  ( (V!5906 (val!2391 Int)) )
))
(declare-datatypes ((ValueCell!2003 0))(
  ( (ValueCellFull!2003 (v!4355 V!5905)) (EmptyCell!2003) )
))
(declare-datatypes ((array!8617 0))(
  ( (array!8618 (arr!4058 (Array (_ BitVec 32) ValueCell!2003)) (size!4384 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8617)

(declare-fun mapDefault!8108 () ValueCell!2003)

(assert (=> b!197959 (= condMapEmpty!8108 (= (arr!4058 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2003)) mapDefault!8108)))))

(declare-fun b!197960 () Bool)

(assert (=> b!197960 (= e!130155 false)))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3590 0))(
  ( (tuple2!3591 (_1!1806 (_ BitVec 64)) (_2!1806 V!5905)) )
))
(declare-datatypes ((List!2524 0))(
  ( (Nil!2521) (Cons!2520 (h!3162 tuple2!3590) (t!7446 List!2524)) )
))
(declare-datatypes ((ListLongMap!2493 0))(
  ( (ListLongMap!2494 (toList!1262 List!2524)) )
))
(declare-fun lt!97670 () ListLongMap!2493)

(declare-fun v!520 () V!5905)

(declare-fun zeroValue!615 () V!5905)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5905)

(declare-fun getCurrentListMapNoExtraKeys!242 (array!8615 array!8617 (_ BitVec 32) (_ BitVec 32) V!5905 V!5905 (_ BitVec 32) Int) ListLongMap!2493)

(assert (=> b!197960 (= lt!97670 (getCurrentListMapNoExtraKeys!242 _keys!825 (array!8618 (store (arr!4058 _values!649) i!601 (ValueCellFull!2003 v!520)) (size!4384 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97669 () ListLongMap!2493)

(assert (=> b!197960 (= lt!97669 (getCurrentListMapNoExtraKeys!242 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197961 () Bool)

(declare-fun res!93762 () Bool)

(assert (=> b!197961 (=> (not res!93762) (not e!130155))))

(assert (=> b!197961 (= res!93762 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4383 _keys!825))))))

(declare-fun mapNonEmpty!8108 () Bool)

(declare-fun tp!17543 () Bool)

(declare-fun e!130156 () Bool)

(assert (=> mapNonEmpty!8108 (= mapRes!8108 (and tp!17543 e!130156))))

(declare-fun mapKey!8108 () (_ BitVec 32))

(declare-fun mapValue!8108 () ValueCell!2003)

(declare-fun mapRest!8108 () (Array (_ BitVec 32) ValueCell!2003))

(assert (=> mapNonEmpty!8108 (= (arr!4058 _values!649) (store mapRest!8108 mapKey!8108 mapValue!8108))))

(declare-fun b!197963 () Bool)

(declare-fun res!93763 () Bool)

(assert (=> b!197963 (=> (not res!93763) (not e!130155))))

(assert (=> b!197963 (= res!93763 (and (= (size!4384 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4383 _keys!825) (size!4384 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197964 () Bool)

(declare-fun res!93760 () Bool)

(assert (=> b!197964 (=> (not res!93760) (not e!130155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8615 (_ BitVec 32)) Bool)

(assert (=> b!197964 (= res!93760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197965 () Bool)

(declare-fun tp_is_empty!4693 () Bool)

(assert (=> b!197965 (= e!130156 tp_is_empty!4693)))

(declare-fun b!197966 () Bool)

(declare-fun res!93758 () Bool)

(assert (=> b!197966 (=> (not res!93758) (not e!130155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197966 (= res!93758 (validKeyInArray!0 k0!843))))

(declare-fun b!197962 () Bool)

(assert (=> b!197962 (= e!130157 tp_is_empty!4693)))

(declare-fun res!93764 () Bool)

(assert (=> start!20182 (=> (not res!93764) (not e!130155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20182 (= res!93764 (validMask!0 mask!1149))))

(assert (=> start!20182 e!130155))

(declare-fun array_inv!2639 (array!8617) Bool)

(assert (=> start!20182 (and (array_inv!2639 _values!649) e!130154)))

(assert (=> start!20182 true))

(assert (=> start!20182 tp_is_empty!4693))

(declare-fun array_inv!2640 (array!8615) Bool)

(assert (=> start!20182 (array_inv!2640 _keys!825)))

(assert (=> start!20182 tp!17542))

(assert (= (and start!20182 res!93764) b!197963))

(assert (= (and b!197963 res!93763) b!197964))

(assert (= (and b!197964 res!93760) b!197958))

(assert (= (and b!197958 res!93761) b!197961))

(assert (= (and b!197961 res!93762) b!197966))

(assert (= (and b!197966 res!93758) b!197957))

(assert (= (and b!197957 res!93759) b!197960))

(assert (= (and b!197959 condMapEmpty!8108) mapIsEmpty!8108))

(assert (= (and b!197959 (not condMapEmpty!8108)) mapNonEmpty!8108))

(get-info :version)

(assert (= (and mapNonEmpty!8108 ((_ is ValueCellFull!2003) mapValue!8108)) b!197965))

(assert (= (and b!197959 ((_ is ValueCellFull!2003) mapDefault!8108)) b!197962))

(assert (= start!20182 b!197959))

(declare-fun m!224187 () Bool)

(assert (=> b!197958 m!224187))

(declare-fun m!224189 () Bool)

(assert (=> b!197957 m!224189))

(declare-fun m!224191 () Bool)

(assert (=> mapNonEmpty!8108 m!224191))

(declare-fun m!224193 () Bool)

(assert (=> start!20182 m!224193))

(declare-fun m!224195 () Bool)

(assert (=> start!20182 m!224195))

(declare-fun m!224197 () Bool)

(assert (=> start!20182 m!224197))

(declare-fun m!224199 () Bool)

(assert (=> b!197964 m!224199))

(declare-fun m!224201 () Bool)

(assert (=> b!197966 m!224201))

(declare-fun m!224203 () Bool)

(assert (=> b!197960 m!224203))

(declare-fun m!224205 () Bool)

(assert (=> b!197960 m!224205))

(declare-fun m!224207 () Bool)

(assert (=> b!197960 m!224207))

(check-sat (not b!197958) tp_is_empty!4693 (not b!197966) (not start!20182) (not b!197964) (not b!197960) (not mapNonEmpty!8108) (not b_next!4837) b_and!11557)
(check-sat b_and!11557 (not b_next!4837))
