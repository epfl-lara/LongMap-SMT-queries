; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82180 () Bool)

(assert start!82180)

(declare-fun mapNonEmpty!33718 () Bool)

(declare-fun mapRes!33718 () Bool)

(declare-fun tp!64323 () Bool)

(declare-fun e!539966 () Bool)

(assert (=> mapNonEmpty!33718 (= mapRes!33718 (and tp!64323 e!539966))))

(declare-datatypes ((V!33195 0))(
  ( (V!33196 (val!10630 Int)) )
))
(declare-datatypes ((ValueCell!10098 0))(
  ( (ValueCellFull!10098 (v!13187 V!33195)) (EmptyCell!10098) )
))
(declare-fun mapValue!33718 () ValueCell!10098)

(declare-fun mapRest!33718 () (Array (_ BitVec 32) ValueCell!10098))

(declare-datatypes ((array!58421 0))(
  ( (array!58422 (arr!28084 (Array (_ BitVec 32) ValueCell!10098)) (size!28563 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58421)

(declare-fun mapKey!33718 () (_ BitVec 32))

(assert (=> mapNonEmpty!33718 (= (arr!28084 _values!1386) (store mapRest!33718 mapKey!33718 mapValue!33718))))

(declare-fun b!957794 () Bool)

(declare-fun res!641118 () Bool)

(declare-fun e!539970 () Bool)

(assert (=> b!957794 (=> (not res!641118) (not e!539970))))

(declare-datatypes ((array!58423 0))(
  ( (array!58424 (arr!28085 (Array (_ BitVec 32) (_ BitVec 64))) (size!28564 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58423)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!957794 (= res!641118 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28564 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28564 _keys!1668))))))

(declare-fun res!641115 () Bool)

(assert (=> start!82180 (=> (not res!641115) (not e!539970))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82180 (= res!641115 (validMask!0 mask!2088))))

(assert (=> start!82180 e!539970))

(assert (=> start!82180 true))

(declare-fun array_inv!21783 (array!58423) Bool)

(assert (=> start!82180 (array_inv!21783 _keys!1668)))

(declare-fun e!539968 () Bool)

(declare-fun array_inv!21784 (array!58421) Bool)

(assert (=> start!82180 (and (array_inv!21784 _values!1386) e!539968)))

(declare-fun b!957795 () Bool)

(declare-fun e!539969 () Bool)

(assert (=> b!957795 (= e!539968 (and e!539969 mapRes!33718))))

(declare-fun condMapEmpty!33718 () Bool)

(declare-fun mapDefault!33718 () ValueCell!10098)

(assert (=> b!957795 (= condMapEmpty!33718 (= (arr!28084 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10098)) mapDefault!33718)))))

(declare-fun b!957796 () Bool)

(declare-fun tp_is_empty!21159 () Bool)

(assert (=> b!957796 (= e!539969 tp_is_empty!21159)))

(declare-fun b!957797 () Bool)

(declare-fun res!641117 () Bool)

(assert (=> b!957797 (=> (not res!641117) (not e!539970))))

(declare-datatypes ((List!19524 0))(
  ( (Nil!19521) (Cons!19520 (h!20682 (_ BitVec 64)) (t!27887 List!19524)) )
))
(declare-fun arrayNoDuplicates!0 (array!58423 (_ BitVec 32) List!19524) Bool)

(assert (=> b!957797 (= res!641117 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19521))))

(declare-fun b!957798 () Bool)

(assert (=> b!957798 (= e!539966 tp_is_empty!21159)))

(declare-fun b!957799 () Bool)

(assert (=> b!957799 (= e!539970 (bvsgt from!2064 (size!28564 _keys!1668)))))

(declare-fun b!957800 () Bool)

(declare-fun res!641116 () Bool)

(assert (=> b!957800 (=> (not res!641116) (not e!539970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58423 (_ BitVec 32)) Bool)

(assert (=> b!957800 (= res!641116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33718 () Bool)

(assert (=> mapIsEmpty!33718 mapRes!33718))

(declare-fun b!957801 () Bool)

(declare-fun res!641119 () Bool)

(assert (=> b!957801 (=> (not res!641119) (not e!539970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957801 (= res!641119 (validKeyInArray!0 (select (arr!28085 _keys!1668) i!793)))))

(declare-fun b!957802 () Bool)

(declare-fun res!641120 () Bool)

(assert (=> b!957802 (=> (not res!641120) (not e!539970))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957802 (= res!641120 (and (= (size!28563 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28564 _keys!1668) (size!28563 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82180 res!641115) b!957802))

(assert (= (and b!957802 res!641120) b!957800))

(assert (= (and b!957800 res!641116) b!957797))

(assert (= (and b!957797 res!641117) b!957794))

(assert (= (and b!957794 res!641118) b!957801))

(assert (= (and b!957801 res!641119) b!957799))

(assert (= (and b!957795 condMapEmpty!33718) mapIsEmpty!33718))

(assert (= (and b!957795 (not condMapEmpty!33718)) mapNonEmpty!33718))

(get-info :version)

(assert (= (and mapNonEmpty!33718 ((_ is ValueCellFull!10098) mapValue!33718)) b!957798))

(assert (= (and b!957795 ((_ is ValueCellFull!10098) mapDefault!33718)) b!957796))

(assert (= start!82180 b!957795))

(declare-fun m!888645 () Bool)

(assert (=> b!957801 m!888645))

(assert (=> b!957801 m!888645))

(declare-fun m!888647 () Bool)

(assert (=> b!957801 m!888647))

(declare-fun m!888649 () Bool)

(assert (=> start!82180 m!888649))

(declare-fun m!888651 () Bool)

(assert (=> start!82180 m!888651))

(declare-fun m!888653 () Bool)

(assert (=> start!82180 m!888653))

(declare-fun m!888655 () Bool)

(assert (=> mapNonEmpty!33718 m!888655))

(declare-fun m!888657 () Bool)

(assert (=> b!957797 m!888657))

(declare-fun m!888659 () Bool)

(assert (=> b!957800 m!888659))

(check-sat (not mapNonEmpty!33718) tp_is_empty!21159 (not b!957801) (not start!82180) (not b!957797) (not b!957800))
(check-sat)
