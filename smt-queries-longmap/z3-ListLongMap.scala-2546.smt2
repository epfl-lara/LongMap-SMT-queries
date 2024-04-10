; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39096 () Bool)

(assert start!39096)

(declare-fun b_free!9363 () Bool)

(declare-fun b_next!9363 () Bool)

(assert (=> start!39096 (= b_free!9363 (not b_next!9363))))

(declare-fun tp!33617 () Bool)

(declare-fun b_and!16749 () Bool)

(assert (=> start!39096 (= tp!33617 b_and!16749)))

(declare-fun b!410772 () Bool)

(declare-fun res!238162 () Bool)

(declare-fun e!246141 () Bool)

(assert (=> b!410772 (=> (not res!238162) (not e!246141))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410772 (= res!238162 (validKeyInArray!0 k0!794))))

(declare-fun b!410773 () Bool)

(declare-fun res!238156 () Bool)

(declare-fun e!246143 () Bool)

(assert (=> b!410773 (=> (not res!238156) (not e!246143))))

(declare-datatypes ((array!24893 0))(
  ( (array!24894 (arr!11896 (Array (_ BitVec 32) (_ BitVec 64))) (size!12248 (_ BitVec 32))) )
))
(declare-fun lt!189147 () array!24893)

(declare-datatypes ((List!6899 0))(
  ( (Nil!6896) (Cons!6895 (h!7751 (_ BitVec 64)) (t!12073 List!6899)) )
))
(declare-fun arrayNoDuplicates!0 (array!24893 (_ BitVec 32) List!6899) Bool)

(assert (=> b!410773 (= res!238156 (arrayNoDuplicates!0 lt!189147 #b00000000000000000000000000000000 Nil!6896))))

(declare-fun b!410774 () Bool)

(declare-fun e!246144 () Bool)

(declare-fun tp_is_empty!10515 () Bool)

(assert (=> b!410774 (= e!246144 tp_is_empty!10515)))

(declare-fun b!410775 () Bool)

(declare-fun res!238157 () Bool)

(assert (=> b!410775 (=> (not res!238157) (not e!246143))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410775 (= res!238157 (bvsle from!863 i!563))))

(declare-fun b!410776 () Bool)

(declare-fun res!238166 () Bool)

(assert (=> b!410776 (=> (not res!238166) (not e!246141))))

(declare-fun _keys!709 () array!24893)

(declare-fun arrayContainsKey!0 (array!24893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410776 (= res!238166 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410777 () Bool)

(declare-fun e!246142 () Bool)

(assert (=> b!410777 (= e!246142 tp_is_empty!10515)))

(declare-fun b!410778 () Bool)

(declare-fun res!238167 () Bool)

(assert (=> b!410778 (=> (not res!238167) (not e!246141))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15125 0))(
  ( (V!15126 (val!5302 Int)) )
))
(declare-datatypes ((ValueCell!4914 0))(
  ( (ValueCellFull!4914 (v!7549 V!15125)) (EmptyCell!4914) )
))
(declare-datatypes ((array!24895 0))(
  ( (array!24896 (arr!11897 (Array (_ BitVec 32) ValueCell!4914)) (size!12249 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24895)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!410778 (= res!238167 (and (= (size!12249 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12248 _keys!709) (size!12249 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410779 () Bool)

(declare-fun res!238158 () Bool)

(assert (=> b!410779 (=> (not res!238158) (not e!246141))))

(assert (=> b!410779 (= res!238158 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12248 _keys!709))))))

(declare-fun b!410780 () Bool)

(assert (=> b!410780 (= e!246143 false)))

(declare-fun minValue!515 () V!15125)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15125)

(declare-fun v!412 () V!15125)

(declare-datatypes ((tuple2!6874 0))(
  ( (tuple2!6875 (_1!3448 (_ BitVec 64)) (_2!3448 V!15125)) )
))
(declare-datatypes ((List!6900 0))(
  ( (Nil!6897) (Cons!6896 (h!7752 tuple2!6874) (t!12074 List!6900)) )
))
(declare-datatypes ((ListLongMap!5787 0))(
  ( (ListLongMap!5788 (toList!2909 List!6900)) )
))
(declare-fun lt!189149 () ListLongMap!5787)

(declare-fun getCurrentListMapNoExtraKeys!1117 (array!24893 array!24895 (_ BitVec 32) (_ BitVec 32) V!15125 V!15125 (_ BitVec 32) Int) ListLongMap!5787)

(assert (=> b!410780 (= lt!189149 (getCurrentListMapNoExtraKeys!1117 lt!189147 (array!24896 (store (arr!11897 _values!549) i!563 (ValueCellFull!4914 v!412)) (size!12249 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189148 () ListLongMap!5787)

(assert (=> b!410780 (= lt!189148 (getCurrentListMapNoExtraKeys!1117 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!238164 () Bool)

(assert (=> start!39096 (=> (not res!238164) (not e!246141))))

(assert (=> start!39096 (= res!238164 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12248 _keys!709))))))

(assert (=> start!39096 e!246141))

(assert (=> start!39096 tp_is_empty!10515))

(assert (=> start!39096 tp!33617))

(assert (=> start!39096 true))

(declare-fun e!246139 () Bool)

(declare-fun array_inv!8682 (array!24895) Bool)

(assert (=> start!39096 (and (array_inv!8682 _values!549) e!246139)))

(declare-fun array_inv!8683 (array!24893) Bool)

(assert (=> start!39096 (array_inv!8683 _keys!709)))

(declare-fun b!410781 () Bool)

(assert (=> b!410781 (= e!246141 e!246143)))

(declare-fun res!238161 () Bool)

(assert (=> b!410781 (=> (not res!238161) (not e!246143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24893 (_ BitVec 32)) Bool)

(assert (=> b!410781 (= res!238161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189147 mask!1025))))

(assert (=> b!410781 (= lt!189147 (array!24894 (store (arr!11896 _keys!709) i!563 k0!794) (size!12248 _keys!709)))))

(declare-fun b!410782 () Bool)

(declare-fun res!238159 () Bool)

(assert (=> b!410782 (=> (not res!238159) (not e!246141))))

(assert (=> b!410782 (= res!238159 (or (= (select (arr!11896 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11896 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410783 () Bool)

(declare-fun res!238163 () Bool)

(assert (=> b!410783 (=> (not res!238163) (not e!246141))))

(assert (=> b!410783 (= res!238163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410784 () Bool)

(declare-fun res!238160 () Bool)

(assert (=> b!410784 (=> (not res!238160) (not e!246141))))

(assert (=> b!410784 (= res!238160 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6896))))

(declare-fun b!410785 () Bool)

(declare-fun mapRes!17394 () Bool)

(assert (=> b!410785 (= e!246139 (and e!246142 mapRes!17394))))

(declare-fun condMapEmpty!17394 () Bool)

(declare-fun mapDefault!17394 () ValueCell!4914)

(assert (=> b!410785 (= condMapEmpty!17394 (= (arr!11897 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4914)) mapDefault!17394)))))

(declare-fun b!410786 () Bool)

(declare-fun res!238165 () Bool)

(assert (=> b!410786 (=> (not res!238165) (not e!246141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410786 (= res!238165 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17394 () Bool)

(assert (=> mapIsEmpty!17394 mapRes!17394))

(declare-fun mapNonEmpty!17394 () Bool)

(declare-fun tp!33618 () Bool)

(assert (=> mapNonEmpty!17394 (= mapRes!17394 (and tp!33618 e!246144))))

(declare-fun mapRest!17394 () (Array (_ BitVec 32) ValueCell!4914))

(declare-fun mapValue!17394 () ValueCell!4914)

(declare-fun mapKey!17394 () (_ BitVec 32))

(assert (=> mapNonEmpty!17394 (= (arr!11897 _values!549) (store mapRest!17394 mapKey!17394 mapValue!17394))))

(assert (= (and start!39096 res!238164) b!410786))

(assert (= (and b!410786 res!238165) b!410778))

(assert (= (and b!410778 res!238167) b!410783))

(assert (= (and b!410783 res!238163) b!410784))

(assert (= (and b!410784 res!238160) b!410779))

(assert (= (and b!410779 res!238158) b!410772))

(assert (= (and b!410772 res!238162) b!410782))

(assert (= (and b!410782 res!238159) b!410776))

(assert (= (and b!410776 res!238166) b!410781))

(assert (= (and b!410781 res!238161) b!410773))

(assert (= (and b!410773 res!238156) b!410775))

(assert (= (and b!410775 res!238157) b!410780))

(assert (= (and b!410785 condMapEmpty!17394) mapIsEmpty!17394))

(assert (= (and b!410785 (not condMapEmpty!17394)) mapNonEmpty!17394))

(get-info :version)

(assert (= (and mapNonEmpty!17394 ((_ is ValueCellFull!4914) mapValue!17394)) b!410774))

(assert (= (and b!410785 ((_ is ValueCellFull!4914) mapDefault!17394)) b!410777))

(assert (= start!39096 b!410785))

(declare-fun m!401143 () Bool)

(assert (=> b!410783 m!401143))

(declare-fun m!401145 () Bool)

(assert (=> b!410776 m!401145))

(declare-fun m!401147 () Bool)

(assert (=> b!410784 m!401147))

(declare-fun m!401149 () Bool)

(assert (=> mapNonEmpty!17394 m!401149))

(declare-fun m!401151 () Bool)

(assert (=> b!410782 m!401151))

(declare-fun m!401153 () Bool)

(assert (=> b!410780 m!401153))

(declare-fun m!401155 () Bool)

(assert (=> b!410780 m!401155))

(declare-fun m!401157 () Bool)

(assert (=> b!410780 m!401157))

(declare-fun m!401159 () Bool)

(assert (=> b!410773 m!401159))

(declare-fun m!401161 () Bool)

(assert (=> b!410786 m!401161))

(declare-fun m!401163 () Bool)

(assert (=> b!410781 m!401163))

(declare-fun m!401165 () Bool)

(assert (=> b!410781 m!401165))

(declare-fun m!401167 () Bool)

(assert (=> b!410772 m!401167))

(declare-fun m!401169 () Bool)

(assert (=> start!39096 m!401169))

(declare-fun m!401171 () Bool)

(assert (=> start!39096 m!401171))

(check-sat (not b!410776) (not b!410786) (not b!410772) (not b!410780) (not b!410781) (not start!39096) tp_is_empty!10515 (not mapNonEmpty!17394) (not b!410783) (not b_next!9363) b_and!16749 (not b!410773) (not b!410784))
(check-sat b_and!16749 (not b_next!9363))
